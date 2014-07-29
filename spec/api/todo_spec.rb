require 'spec_helper'

describe API::Base do
  
  describe API::V1::Todos do
    describe "GET /api/v1/todos/:id" do
      it "returns a todo by id" do
        todo = Todo.create!(title: "Title 1", description: "Description 1")
        get "/api/v1/todos/#{todo.id}"
        expect(response.body).to eq({ id: todo.id, title: "Title 1", description: "Description 1", complete: false }.to_json)
      end
    end
  end

end