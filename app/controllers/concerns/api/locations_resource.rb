module Api
  module LocationsResource
    def show
      api_respond_with ApiResponse::Success.new(locations_collection)
    end

    private

    def locations_collection
      ApiData::LocationsByCountryCollection.new(params[:country_code])
    end
  end
end
