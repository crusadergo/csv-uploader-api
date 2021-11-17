module Types
  class MutationType < Types::BaseObject
    field :createCsv, mutation: Mutations::Upload

    field :updateCsv, mutation: Mutations::Update

    field :destroyCsv, mutation: Mutations::Destroy

    field :createUser, mutation: Mutations::CreateUser
  end
end
