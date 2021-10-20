module Types
    module Input
        class CsvStorageInputType < Types::BaseInputObject
            argument :title, String, required: true
            argument :file, ApolloUploadServer::Upload, required: false
        end
    end
end
