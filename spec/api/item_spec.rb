require 'spec_helper'

describe API::Base do
  
  describe API::V1::Items do
    describe "GET /api/v1/items/:id" do
      it "returns an item by id" do
        todo = Todo.create!(title: "Title 1", description: "Description 1")
        item = Item.create!(description: "Description 1", complete: true, todo: todo)
        get "/api/v1/items/#{item.id}"
        expect(response.body).to eq({ id: item.id, description: "Description 1", complete: true }.to_json)
      end
    end
  end

end