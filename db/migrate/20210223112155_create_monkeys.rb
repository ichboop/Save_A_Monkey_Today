class CreateMonkeys < ActiveRecord::Migration[6.0]
  def change
    create_table :monkeys do |t|
      t.string :name
      t.string :city
      t.text :description
      t.string :destination
      t.string :species
      t.integer :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
