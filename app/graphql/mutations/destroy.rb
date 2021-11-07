module Mutations
    class Destroy < Mutations::BaseMutation
        argument :params, Types::Destroy::CsvStorageDestroyType, required: true

        field :csvs, resolver: Queries::FetchCsvStorage

        def resolve(params:)
            csv_params = Hash(params)

            begin
                item = CsvStorage.find(csv_params[:id])

                return GraphQL::ExecutionError.new("Record not found!") unless item

                item.destroy!

                { csvs: csvs }
            rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                " #{e.record.errors.full_messages.join(', ')}")
            end
        end
    end
end
