class AddAvailabilityStatustoFlat < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :availability_status, :boolean
  end
end
