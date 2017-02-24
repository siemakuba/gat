module Api
  module Internal
    class EvaluateTargetsController < BaseController
      def create
        response = if validator.valid?
          pricing_factor = PricingEvaluator.new(country_code: evaluation_params[:country_code]).perform
          evaluation_data = ApiData::PricingEvaluation.new(
            params: evaluation_params,
            pricing_calculator: PricingCalculator.new(pricing_factor)
          )

          ApiResponse::Success.new(evaluation_data)
        else
          ApiResponse::Errors.new(validator.errors.full_messages)
        end

        api_respond_with response
      end

      private

      def validator
        @validator ||= EvaluationParamsValidator.new(*evaluation_params.values)
      end

      def evaluation_params
        params.slice(:country_code, :target_group_id, :locations)
      end
    end
  end
end
