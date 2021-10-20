module Types
  class MutationType < Types::BaseObject
    field :create_csv, mutation: Mutations::Upload
  end
end
