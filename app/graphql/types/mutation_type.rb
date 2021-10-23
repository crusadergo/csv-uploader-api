module Types
  class MutationType < Types::BaseObject
    field :createCsv, mutation: Mutations::Upload
  end
end
