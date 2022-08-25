class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.text :description
      t.string :location
      t.float :lat
      t.float :lng
      t.decimal :price
      t.integer :num_occupants
      t.integer :num_bedroom
      t.integer :num_bathroom
      t.date :avail_dates
      t.boolean :availibility_status
      t.string :photo_url, default: nil
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
