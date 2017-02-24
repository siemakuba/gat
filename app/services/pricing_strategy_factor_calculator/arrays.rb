module PricingStrategyFactorCalculator
  class Arrays < Base

    private

    def factor_divident
      Array(data).count do |element|
        element.is_a?(Array) && element.length >= pattern
      end
    end
  end
end
