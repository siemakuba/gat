module Api
  module TargetGroupsResource
    def show
      response = ApiResponse::Success.new(target_groups_collection)
      api_response(response)
    end

    private

    def target_groups_collection
      ApiData::TargetGroupsByCountryCollection.new(country_code)
    end

    def country_code
      params.permit(:country_code).fetch(:country_code)
    end
  end
end
