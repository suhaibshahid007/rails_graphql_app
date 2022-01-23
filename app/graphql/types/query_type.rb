module Types
  class QueryType < Types::BaseObject
    # /users
    field :users, [Types::UserType], null: false
    # /posts
    field :posts, [Types::PostType], null: false

    def posts
      Post.all
    end

    def users
      User.all
    end

    # users/:id
    field :user, Types::UserType, null: false do
      argument :id, Integer, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end
  end
end
