module API
  module V1
    class Items < Grape::API
      include API::V1::Defaults

      resource :items do

        desc "Just a single item"
        get ':id' do
          item = Item.find(params[:id])
          present item, with: API::V1::Entities::Item          
        end

      end

    end
  end
end