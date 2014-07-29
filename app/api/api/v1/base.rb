module API
  module V1
    class Base < Grape::API
      mount API::V1::Todos
      mount API::V1::Items
    end
  end
end