class CreateCountriesTargetGroups < ActiveRecord::Migration
  def change
    create_table :countries_target_groups, id: false do |t|
      t.references :country, null: false, index: true
      t.references :target_group, null: false, index: true
    end
  end
end
