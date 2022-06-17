module Queries
    class FetchTodo < Queries::BaseQuery
        type Types::TodoType, null: false
        argument :id, ID, required: true

        def resolve(id:)
            Todo.find(id)
        end
    end
end