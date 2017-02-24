module PricingStrategyFactorCalculator
  class Letters < Base
    private

    def factor_divident
      data.count pattern
    end
  end
end
