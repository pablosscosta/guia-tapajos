class CreatePois < ActiveRecord::Migration[7.1]
  def change
    create_table :pois do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :address
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
