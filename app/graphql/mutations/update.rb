module Mutations
    class Update < Mutations::BaseMutation
        argument :params, Types::Update::CsvStorageUpdateType, required: true

        # field :item, Types::CsvStorageType, null: false

        def resolve(params:)
            csv_params = Hash(params)

            begin
                item = CsvStorage.find(csv_params[:id])

                return GraphQL::ExecutionError.new("Record not found!") unless item

                item.update!(csv_params)

                { item: {
                    filename: item.filename,
                    title: item.title,
                    file: item.file,
                    id: item.id
                } }
            rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                " #{e.record.errors.full_messages.join(', ')}")
            end
        end
    end
end
