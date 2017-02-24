module Api
  module Authentication
    extend ActiveSupport::Concern

    included do
      rescue_from UnauthorizedRequest do
        response = ApiResponse::Unauthorized.new(auth_key)
        api_response(response)
      end

      before_filter :authenticate_request!
    end

    private

    def authenticate_request!
      raise UnauthorizedRequest.new(auth_key) unless valid_auth_key?
    end

    def valid_auth_key?
      auth_key == Rails.configuration.api['auth_key']
    end

    def auth_key
      request.headers['X-InternalApiAuthKey']
    end
  end
end


class UnauthorizedRequest < StandardError; end
