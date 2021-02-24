class AddAddressForGeocoderToMonkeys < ActiveRecord::Migration[6.0]
  def change
    add_column :monkeys, :latitude, :float
    add_column :monkeys, :longitude, :float
  end
end
