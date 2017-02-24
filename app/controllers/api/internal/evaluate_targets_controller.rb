module Api
  module Internal
    class EvaluateTargetsController < BaseController
      def create
        evaluation_params
      end

      private

      def evaluation_params
        {
          country_code: params.require(:country_code),
          target_group_id: params.require(:target_group_id),
          locations: params.require(:locations)
        }
      end
    end
  end
end
