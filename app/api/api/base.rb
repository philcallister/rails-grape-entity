require 'grape-swagger'

module API
  class Base < Grape::API
    mount API::V1::Base

    # This could be uncommented to support an additional version
    # mount API::V2::Base
    add_swagger_documentation :api_version => 'v1', :base_path => '/api'
  end
end