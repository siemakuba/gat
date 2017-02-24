module PricingStrategy
  class Base

    def initialize(data)
      @data = data
    end

    def factor
      calculate_factor
    end

    private
    attr_reader :data

    # def raw_data
    #   @raw_data ||= Rails.cache.fetch(cache_key, expires_in: cache_ttl) do
    #     ::ExternalData::Fetcher.new(source: data_source, parser: data_parser).perform
    #   end
    # end

    # def cache_key
    #   [self.class.name.underscore, :data].join('/')
    # end

    # def cache_ttl
    #   24.hours
    # end
  end
end
