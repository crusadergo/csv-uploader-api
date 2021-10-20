module Mutations
    class Upload < Mutations::BaseMutation
        argument :params, Types::Input::CsvStorageInputType, required: true

        field :csv_object, Types::CsvStorageType, null: false

        def resolve(params:)
            csv_params = Hash(params)

            begin
                csv_object = CsvStorage.create!(csv_params)

                { csv_object: csv_object }
            rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                " #{e.record.errors.full_messages.join(', ')}")
            end
        end
    end
end
