module Api
  module Responses
    extend ActiveSupport::Concern

    included do
      rescue_from StandardError do |exception|
        api_respond_with ApiResponse::Exception.new(exception)
      end
    end

    private

    def api_respond_with(response)
      render json: response.to_json, status: response.status and return
    end
  end
end
