class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :location
      t.float :price
      t.integer :occupants
      t.references :user, null: false, foreign_key: true
      t.date :avail_dates

      t.timestamps
    end
  end
end
