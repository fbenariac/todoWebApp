class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :user, :boolean
    add_column :users, :guest, :boolean
  end
end
