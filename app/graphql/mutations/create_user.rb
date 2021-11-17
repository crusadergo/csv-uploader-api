module Mutations
    class CreateUser < BaseMutation
        class AuthProviderSignupData < Types::BaseInputObject
            argument :credentials, Types::AuthProviderCredentialsInput, required: false
        end

        argument :auth_provider, AuthProviderSignupData, required: false

        type Types::UserType

        def resolve(auth_provider: nil)
            User.create!(
                email: auth_provider&.[](:credentials)&.[](:login),
                password: auth_provider&.[](:credentials)&.[](:password)
            )
        rescue ActiveRecord::RecordInvalid => e
            GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
        end
    end
end
