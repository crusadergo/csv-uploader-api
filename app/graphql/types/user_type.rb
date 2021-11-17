module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :login, String, null: false
  end
end
