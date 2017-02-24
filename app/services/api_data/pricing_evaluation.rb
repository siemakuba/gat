module ApiData
  class PricingEvaluation < Base

    def initialize(params:, pricing_factor:, pricing_calculator:)
      @params = params
      @pricing_factor = pricing_factor
      @pricing_calculator = pricing_calculator
    end

    private
    attr_reader :params, :pricing_factor, :pricing_calculator

    def collection_data
      {
        country_code: params[:country_code],
        target_group_id: params[:target_group_id],
        locations: params[:locations],
        calculated_prices: calculated_prices_data
      }
    end

    def calculated_prices_data
      params[:locations].map do |location|
        price = pricing_calculator.calculate(
          panel_size: location[:panel_size]
        )
        location.merge(calculated_price: price)
      end
    end

    def country
      @country ||= Country.by_country_code(params[:country_code]).first!
    end
  end
end
