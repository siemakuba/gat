module Api
  module Responses
    extend ActiveSupport::Concern

    included do
      rescue_from StandardError do |exception|
        response = ApiResponse::Exception.new(exception)
        api_response(response)
      end
    end

    private

    def api_response(response)
      render json: response.to_json, status: response.status and return
    end
  end
end
