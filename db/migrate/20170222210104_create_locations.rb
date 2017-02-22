class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :external_id, null: true
      t.string :secret_code, null: true
      t.timestamps null: false
    end
  end
end
