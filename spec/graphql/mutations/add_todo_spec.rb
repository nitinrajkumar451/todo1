require 'rails_helper'
module Queries
    RSpec.describe Todo, type: :request do

        describe '.resolve' do
            it 'adds a todo to the existing list of todos' do
                todo = create(:todo)
                post '/graphql', params: {query: query}
                expect do
                    post '/graphql', params: { query: query }
                end.to change { Todo.count }.by(1)
            end
            it 'returns a todo' do
                author = create(:todo)
      
                post '/graphql', params: { query: query }
                json = JSON.parse(response.body)
                data = json['data']['addTodo']['todo']     
                expect(data).to include(
                  'id'              => be_present,
                  'title'           => 'alpha',
                  'description'      => "beta",
                  'status'           => 'pending'
                )
            end
          
        end
        def query()
            <<~GQL
            mutation{

                addTodo(input:{params:{title:"alpha", description:"beta"}}){
                  todo{
                    title
                    description
                    status
                    id
                  }
                }
                  
                
              }
                 
            GQL
        end

    end
    
end