module ApiData
  class TargetGroupsByCountryCollection
    include Enumerable
    alias_method :to_hash, :to_h

    def initialize(country_code)
      @country_code = country_code
    end

    def each(&block)
      collection_data.each(&block)
    end

    private
    attr_reader :country_code

    def collection_data
      {
        country_code: country_code,
        provider_id: country.panel_provider_id,
        target_groups: target_groups_data
      }
    end

    def target_groups_data
      target_groups.map do |target_group|
        { name: target_group.name, id: target_group.id }
      end
    end

    def country
      @country ||= Country.by_country_code(country_code).first!
    end

    def target_groups
      @target_groups ||= country.panel_provider.target_groups
    end
  end
end
