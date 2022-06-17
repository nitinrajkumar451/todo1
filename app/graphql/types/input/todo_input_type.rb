module Types
    module Input
        class TodoInputType <Types::BaseInputObject
            argument :title, String, required: true
            argument :description, String, required: true
            argument :status, String, required: false, default_value: "pending"
        end
    end
end