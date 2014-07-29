require 'grape'

module API
  module V1
    module Entities
    
      class Item < Grape::Entity
        expose :id
        expose :description, documentation: { type: "String", desc: "Item description information. " }
        expose :complete
      end
      
      class Todo < Grape::Entity
        expose :id
        expose :title, documentation: { type: "String", desc: "Todo title name." }
        expose :description, documentation: { type: "String", desc: "Todo description information." }
        expose :complete
        expose :items, using: API::V1::Entities::Item, if: { type: 'all' }
      end
      
    end
  end
end