class CreateGetaways < ActiveRecord::Migration[6.0]
  def change
    create_table :getaways do |t|
      t.date :date
      t.references :monkey, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
