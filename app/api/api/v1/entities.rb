require 'grape'

module API
  module V1
    module Entities
    
      class Item < Grape::Entity
        expose :id, documentation: { type: "Integer", desc: "Item's unique id"}
        expose :description, documentation: { type: "String", desc: "Item description information. " }
        expose :complete, documentation: { type: "String", desc: "Is this item complete?" }
      end
      
      class Todo < Grape::Entity
        expose :id, documentation: { type: "Integer", desc: "Todo's unique id"}
        expose :title, documentation: { type: "String", desc: "Todo title name." }
        expose :description, documentation: { type: "String", desc: "Todo description information." }
        expose :complete, documentation: { type: "String", desc: "Is this todo complete?" }
        expose :items, using: API::V1::Entities::Item, documentation: { type: "Item", desc: "Items for this todo", is_array: true }, if: { type: 'all' }
      end
      
    end
  end
end