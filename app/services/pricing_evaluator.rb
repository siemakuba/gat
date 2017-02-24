class PricingEvaluator
  def initialize(country_code:)
    @country_code = country_code
  end

  def perform
    return 0 unless pricing_strategy
    pricing_factor_calculator_klass.new(external_data).factor
  end

  private
  attr_reader :country_code
  delegate :data_source, :data_kind, :strategy, to: :pricing_strategy

  def external_data
    @external_data ||= Rails.cache.fetch(cache_key, expires_in: cache_ttl) do
      ExternalData::Fetcher.new(source: data_source, parser: external_data_parser).perform
    end
  end

  def external_data_parser
    "external_data/parser/#{data_kind}".camelize.constantize.new
  end

  def pricing_factor_calculator_klass
    "pricing_strategy_factor_calculator/#{strategy}".camelize.constantize
  end

  def country
    @country ||= Country.by_country_code(country_code).first!
  end

  def panel_provider
    @panel_provider ||= country.panel_provider
  end

  def pricing_strategy
    @pricing_strategy ||= PanelProvidersStrategies.new.detect do |strategy|
      strategy.code.to_s == panel_provider.code
    end
  end

  def cache_key
    [data_source, data_kind].join('/')
  end

  def cache_ttl
    24.hours
  end
end
