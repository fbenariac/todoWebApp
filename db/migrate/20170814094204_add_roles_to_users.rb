# 20170814094204_add_roles_to_users
class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :user, :boolean, default: false
    add_column :users, :guest, :boolean, default: true
  end
end
