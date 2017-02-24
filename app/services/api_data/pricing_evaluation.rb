module ApiData
  class PricingEvaluation

    def initialize(params:, pricing_calculator:)
      @params = params
      @pricing_calculator = pricing_calculator
    end

    def data
      params.merge(calculated_prices: calculated_prices_data)
    end

    alias_method :to_hash, :data

    private
    attr_reader :params, :pricing_calculator

    def calculated_prices_data
      locations.map do |location|
        price = pricing_calculator.calculate(
          panel_size: location[:panel_size]
        )
        location.merge(calculated_price: price)
      end
    end

    def locations
      Array(params[:locations])
    end
  end
end
