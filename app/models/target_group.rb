class TargetGroup < ActiveRecord::Base
  has_and_belongs_to_many :countries
  belongs_to :panel_provider
  belongs_to :parent, class_name: 'TargetGroup'
  has_many :children, class_name: 'TargetGroup', foreign_key: :parent_id

  scope :root_nodes, -> { where(parent_id: nil) }
end
