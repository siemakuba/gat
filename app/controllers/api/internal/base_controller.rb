module Api
  module Internal
    class BaseController < ApplicationController
      include Api::Responses
      include Api::Authentication
    end
  end
end
