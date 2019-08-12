class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :price_per_day
      t.integer :capacity
      t.string :location
      t.string :type
      t.string :owner_name

      t.timestamps
    end
  end
end
