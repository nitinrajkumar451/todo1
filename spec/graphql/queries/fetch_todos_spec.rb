require 'rails_helper'
module Queries
    RSpec.describe Todo, type: :request do

        describe '.resolve' do
            it 'returns list of added todos' do
                todo = create(:todo, title: 'Lee', description: 'Child')
                todo = create(:todo, title: 'Lee1', description: 'Child')
                post '/graphql', params: {query: query}
                json = JSON.parse(response.body)
                data = json['data']['fetchTodos']
                expect(data.length).to eq(2)
                expect(data[0]["title"]).to eq("Lee")
            end
        end
        def query
            <<~GQL
            query{
                fetchTodos{
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