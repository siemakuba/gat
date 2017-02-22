class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_code, null: false, index: true
      t.references :panel_provider, null: false, index: true
      t.timestamps null: false
    end
  end
end
