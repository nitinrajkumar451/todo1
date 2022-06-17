module Mutations
    class AddTodo < Mutations::BaseMutation
        argument :params, Types::Input::TodoInputType, required: true
        field :todo, Types::TodoType, null: false
        def resolve(params:)
            todo_params = Hash params
            todo= Todo.create!(todo_params)
            {todo: todo}
        end
    end
end

