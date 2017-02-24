module Api
  module TargetGroupsResource
    def show
      api_respond_with ApiResponse::Success.new(target_groups_collection)
    end

    private

    def target_groups_collection
      ApiData::TargetGroupsByCountryCollection.new(params[:country_code])
    end
  end
end
