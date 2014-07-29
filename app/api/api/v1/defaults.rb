module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do

        # common Grape settings
        version 'v1' # path-based versioning by default
        format :json # only json here...no XML

        # Global handler for simple not found case
        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        # Global exception handler, used for error notifications
        rescue_from :all do |e|
          if Rails.env.development?
            raise e
          else
            # Raven for exception logging, or something like it...
            # Raven.capture_exception(e)
            # error_response(message: "Internal server error", status: 500)
          end
        end

        # Placeholder for authentication -- Warden, Devise, etc...
        before do
          # error!('Unauthorized', 401) unless headers['Authorization'] == "some token"
        end

      end
    end
  end
end