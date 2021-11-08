module Mutations
    class Upload < Mutations::BaseMutation
        argument :params, Types::Input::CsvStorageInputType, required: true

        field :item, Types::CsvStorageType, null: false

        def resolve(params:)
            csv_params = Hash(params)

            begin
                item = CsvStorage.create!(csv_params)

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
