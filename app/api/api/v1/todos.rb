module API
  module V1
    class Todos < Grape::API
      include API::V1::Defaults

      resource :todos do

        desc "Return list of todos"
        get do
          todos = Todo.all
          present todos, with: API::V1::Entities::Todo, type: params[:type]       
        end

        desc "Just a single todo"
        get ':id' do
          todo = Todo.find(params[:id])
          present todo, with: API::V1::Entities::Todo, type: params[:type]
        end

        desc "Return list of items for given todo"
        get ':id/items' do
          todo = Todo.find(params[:id])
          present todo.items, with: API::V1::Entities::Item
        end

      end

    end
  end
end