class AddDescriptionNumBathroomNumBedroomAmenitiesToFlat < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :description, :text
    add_column :flats, :num_bedroom, :integer
    add_column :flats, :num_bathroom, :integer
    add_column :flats, :amenities, :string
  end
end
