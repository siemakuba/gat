class PricingStrategyValues

  class Values < Struct.new(:divider, :pattern, :precision)
  end

  class << self
    def arrays
      Values.new(1, 1, 2)
    end

    def letters
      Values.new(100, 'a', 2)
    end

    def nodes
      Values.new(100, /<([^\/]*?)>/m, 2)
    end
  end
end
