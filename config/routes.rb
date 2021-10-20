Rails.application.routes.draw do
    if Rails.env.development?
        mount GraphQL::Playground::Engine, at: "/graphql-playground", graphql_path: "/graphql"
    end

    post "/graphql", to: "graphql#execute"
end
