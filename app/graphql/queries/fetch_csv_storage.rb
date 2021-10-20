module Queries
    class FetchCsvStorage < Queries::BaseQuery

        type [Types::CsvStorageType], null: false

        def resolve
            CsvStorage.all.order(created_at: :desc)
        end
    end
end
