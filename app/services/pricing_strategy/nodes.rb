module PricingStrategy
  class Nodes < Base
    QUANTIFIER = 100

    private

    def calculate_factor
      Rational(nodes_quantity, QUANTIFIER)
    end

    def nodes_quantity
      data.to_s.scan(html_opening_tag_pattern).count
    end

    def html_opening_tag_pattern
      /<([^\/]*?)>/m
    end
  end
end
