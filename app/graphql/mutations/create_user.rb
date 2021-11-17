module Mutations
    class CreateUser < Mutations::BaseMutation
        argument :params, Types::Input::UserInputType, required: true

        field :user, Types::UserType, null: false

        def resolve(params:)
            user_params = Hash(params)

            begin
                user = User.create!(user_params)

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
