module Api
  module LocationsResource
    def show
      response = ApiResponse::Success.new(locations_collection)
      api_response(response)
    end

    private

    def locations_collection
      ApiData::LocationsByCountryCollection.new(country_code)
    end

    def country_code
      params.permit(:country_code).fetch(:country_code)
    end
  end
end
