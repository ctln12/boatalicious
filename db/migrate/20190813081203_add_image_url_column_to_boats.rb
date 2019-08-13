class AddImageUrlColumnToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :image_url, :string
  end
end
