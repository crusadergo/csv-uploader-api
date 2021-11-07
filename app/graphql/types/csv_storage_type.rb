module Types
    class CsvStorageType < Types::BaseObject
        field :id, ID, null: false
        field :file, ApolloUploadServer::Upload, null: false
        field :title, String, null: false
        field :filename, String, null: false
    end
end
