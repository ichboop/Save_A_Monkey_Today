class AddAddressToMonkey < ActiveRecord::Migration[6.0]
  def change
    add_column :monkeys, :address, :string
  end
end
