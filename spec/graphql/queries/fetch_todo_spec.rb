require 'rails_helper'
module Queries
    RSpec.describe Todo, type: :request do

        describe '.resolve' do
            it 'returns a todo when the id exists' do
                todo = create(:todo, title: '200% zoom content clipping', description: 'When the user zooms his browser content gets clipped')
                post '/graphql', params: {query: query(id: todo.id)}
                json = JSON.parse(response.body)
                data = json['data']['fetchTodo']
                expect(data).not_to eq(nil)
            end
            it 'returns the todo for the passed id' do
                todo = create(:todo, title: '200% zoom content clipping', description: 'When the user zooms his browser content gets clipped')
                post '/graphql', params: {query: query(id: todo.id)}
                json = JSON.parse(response.body)
                data = json['data']['fetchTodo']
                expect(data).to include(
                    'id'          => be_present,
                    'title'   => '200% zoom content clipping',
                    'description'    => 'When the user zooms his browser content gets clipped',
                    'status' => 'pending'
                  )
                
            end
        end
        def query(id:)
            <<~GQL
            query{
                fetchTodo(id : #{id}){
                  title
                  id
                  description
                  status
                }
              }
            GQL
        end

    end
    
end