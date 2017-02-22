class LocationGroup < ActiveRecord::Base
  has_and_belongs_to_many :locations
  belongs_to :panel_provider
  belongs_to :country
end
