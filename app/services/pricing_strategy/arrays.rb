module PricingStrategy
  class Nodes < Base
    MIN_SIZE = 10
    QUANTIFIER = 100

    private

    def calculate_factor
      100
    end

    def nodes_quantity
      data.to_s.scan(html_opening_tag_pattern).count
    end

    def html_opening_tag_pattern
      /<([^\/]*?)>/m
    end
  end
end
