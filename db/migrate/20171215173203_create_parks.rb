class CreateParks < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :description
      t.string :address
      t.boolean :bathroom
      t.boolean :drinking_fountain
      t.boolean :dog_park
      t.boolean :playground
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
