module ApiData
  class LocationsByCountryCollection < Base

    def initialize(country_code)
      @country_code = country_code
    end

    private
    attr_reader :country_code

    def collection_data
      {
        country_code: country_code,
        provider_id: country.panel_provider_id,
        locations: locations_data
      }
    end

    def locations_data
      locations.map do |location|
        { name: location.name, id: location.id }
      end
    end

    def country
      @country ||= Country.by_country_code(country_code).first!
    end

    def locations
      @locations ||= country.panel_provider.locations
    end
  end
end
