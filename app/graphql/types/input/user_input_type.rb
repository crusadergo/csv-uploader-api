module Types
    module Input
        class UserInputType < Types::BaseInputObject
            argument :login, String, required: true
            argument :password, String, required: true
        end
    end
end
