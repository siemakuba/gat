class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :location_groups
  has_and_belongs_to_many :target_groups, -> { where( parent_id: nil ) }

  scope :by_country_code, ->(code) { where(country_code: code) }
end
