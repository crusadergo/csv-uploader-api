module Mutations
    class SignInUser < BaseMutation
        null true

        argument :params, Types::Input::UserInputType, required: true

        field :token, String, null: true
        field :user, Types::UserType, null: true

        def resolve(params:)
            user_params = Hash(params)

            begin
                user = User.find_by(login: user_params[:login])

                return unless user
                return unless user.authenticate(user_params[:password])

                crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
                token = crypt.encrypt_and_sign("user-id:#{ user.id }")

                { user: {
                    id: user.id,
                    login: user.login
                } }
            rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                " #{e.record.errors.full_messages.join(', ')}")
            end
        end
    end
end
