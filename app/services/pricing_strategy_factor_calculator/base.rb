module PricingStrategyFactorCalculator
  class Base

    def initialize(data)
      @data = data
    end

    def factor
      @factor ||= calculate_factor
    end

    private
    attr_reader :data
    delegate :divider, :pattern, :precision, to: :values

    def calculate_factor
      Rational(factor_divident, factor_divider).to_f.round(precision)
    end

    def factor_divident
      0
    end

    def factor_divider
      divider || 1
    end

    def values
      @values ||= begin
        method_name = self.class.name.demodulize.downcase
        PricingStrategyValues.send(method_name)
      end
    end
  end
end
