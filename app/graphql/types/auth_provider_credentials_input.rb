module Types
    class AuthProviderCredentialsInput < BaseInputObject
        graphql_name 'AUTH_PROVIDER_CREDENTIALS'

        argument :login, String, required: true
        argument :password, String, required: true
    end
end
