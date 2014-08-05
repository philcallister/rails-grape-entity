module API
  module V1
    class Todos < Grape::API
      include API::V1::Defaults

      resource :todos do

        #####
        desc "Return a list of todos", { :entity => API::V1::Entities::Todo }
        params do
          optional :type, type: String, desc: "Use type 'all' to include todo items on the response"
        end
        get '/' , http_codes: [
          [200, 'Ok', API::V1::Entities::Todo]
        ] do
          todos = Todo.all
          present todos, with: API::V1::Entities::Todo, type: params[:type]       
        end

        #####
        desc "Just a single todo", { :entity => API::V1::Entities::Todo }
        params do
          optional :type, type: String, desc: "Use type 'all' to include todo items on the response"
          requires :id, type: Integer
        end
        get ':id', http_codes: [
          [200, "Ok", API::V1::Entities::Todo]
        ] do
          todo = Todo.find(params[:id])
          present todo, with: API::V1::Entities::Todo, type: params[:type]
        end

        #####
        desc "Return list of items for given todo", { :entity => API::V1::Entities::Item }
        params do
          requires :id, type: Integer
        end
        get ':id/items', http_codes: [
          [200, "Ok", API::V1::Entities::Todo]
        ] do
          todo = Todo.find(params[:id])
          present todo.items, with: API::V1::Entities::Item
        end

        #####
        desc "Create a new todo", { :entity => API::V1::Entities::Todo }
        params do
          requires :title, type: String, desc: "The title for this todo"
          optional :description, type: String, desc: "The description for this todo"
        end
        post '/', http_codes: [
          [200, "Ok", API::V1::Entities::Todo]
        ] do
          todo = Todo.new
          todo.title = params[:title] if params[:title]
          todo.description = params[:description] if params[:description]
          todo.save 
          
          status 200
          present todo, with: API::V1::Entities::Todo
        end

        #####
        desc "Delete an existing todo"
        params do
          requires :id, type: Integer
        end
        delete ':id' do
          Todo.destroy(params[:id])
        end

      end
    end
  end
end