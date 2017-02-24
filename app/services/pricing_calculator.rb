class PricingCalculator
  def initialize(pricing_factor)
    @pricing_factor = pricing_factor
  end

  def calculate(panel_size: 0)
    (panel_size.to_i * pricing_factor.to_f).round(2)
  end

  private
  attr_reader :pricing_factor
end
