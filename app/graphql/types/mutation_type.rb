module Types
  class MutationType < Types::BaseObject
    field :createCsv, mutation: Mutations::Upload

    field :updateCsv, mutation: Mutations::Update

    field :destroyCsv, mutation: Mutations::Destroy
  end
end
