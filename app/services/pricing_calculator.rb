class PricingCalculator
  def initialize(base_price:, pricing_strategy:)
    @base_price = base_price
    @pricing_strategy = pricing_strategy
  end

  def calculate
    base_price * pricing_strategy_factor
  end

  private
  attr_reader :base_price, :pricing_strategy
  delegate :factor, to: :pricing_strategy, prefix: true
end
