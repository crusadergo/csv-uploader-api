module Types
    module Destroy
        class CsvStorageDestroyType < Types::BaseInputObject
            argument :id, Int, required: true
        end
    end
end
