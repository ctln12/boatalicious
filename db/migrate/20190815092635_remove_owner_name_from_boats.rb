class RemoveOwnerNameFromBoats < ActiveRecord::Migration[5.2]
  def change
    remove_column :boats, :owner_name
  end
end
