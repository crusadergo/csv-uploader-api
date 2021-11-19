module Mutations
    class CreateUser < Mutations::BaseMutation
        argument :params, Types::Input::UserInputType, required: true

        field :user, Types::UserType, null: false
        field :token, String, null: true

        def resolve(params:)
            user_params = Hash(params)

            begin
                user = User.create!(user_params)

                crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
                token = crypt.encrypt_and_sign("user-id:#{ user.id }")
                context[:session][:token] = token

                { user: {
                    id: user.id,
                    login: user.login
                }, token: token }
            rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                " #{e.record.errors.full_messages.join(', ')}")
            end
        end
    end
end
