class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :location
      t.decimal :price
      t.integer :occupants
      t.references :user, foreign_key: true
      t.date :avail_dates
      t.string :photo_url, default: nil

      t.timestamps
    end
  end
end
