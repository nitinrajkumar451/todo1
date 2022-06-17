require 'rails_helper'

RSpec.describe Todo, type: :model do
  let!(:todo) { create(:todo) }

  it 'is valid with valid attributes' do


    user = Todo.new
    user.title="beta@incubyte.co"
    user.description="alpha"
    expect(user).to be_valid
    expect(subject.attributes).to include("title")
  end
  it 'is not valid without title' do
    user = Todo.new('title'=>nil)
    expect(user).not_to be_valid
  end
  
end
