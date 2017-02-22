class CreateLocationGroups < ActiveRecord::Migration
  def change
    create_table :location_groups do |t|
      t.string :name, null: false
      t.references :country, null: false, index: true
      t.references :panel_provider, null: false, index: true
      t.timestamps null: false
    end
  end
end
