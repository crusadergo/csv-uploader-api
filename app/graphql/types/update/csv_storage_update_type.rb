module Types
    module Update
        class CsvStorageUpdateType < Types::BaseInputObject
            argument :title, String, required: true
            argument :id, Int, required: true
        end
    end
end
