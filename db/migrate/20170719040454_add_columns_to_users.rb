class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active_rent, :boolean
  end
end
