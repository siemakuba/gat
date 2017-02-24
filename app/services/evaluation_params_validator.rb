class EvaluationParamsValidator < Struct.new(:country_code, :target_group_id, :locations)
  include ActiveModel::Validations

  validates :country_code, presence: true
  validates :target_group_id, presence: true
  validates :locations, presence: true

  validate :locations_structure, if: -> (object) do
    object.locations.present?
  end

  private

  def locations_structure
    errors.add(:locations, :invalid_structure) unless valid_locations_structure?
  end

  def valid_locations_structure?
    locations.is_a?(Array) && locations.all? do |item|
      item.is_a?(Hash) && item.has_key?(:id) && item.has_key?(:panel_size)
    end
  end
end
