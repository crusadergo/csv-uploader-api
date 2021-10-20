module Types
    class CsvStorageType < Types::BaseObject
        field :id, ID, null: false
        field :file, ApolloUploadServer::Upload, null: true
        field :title, String, null: false
    end
end
