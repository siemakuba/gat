module PricingStrategyFactorCalculator
  class Nodes < Base
    private

    def factor_divident
      data.to_s.scan(pattern).count
    end
  end
end
