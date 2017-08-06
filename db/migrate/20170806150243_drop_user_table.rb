# 20170806150243 drop_user_table
class DropUserTable < ActiveRecord::Migration[5.1]
  def self.up
    drop_table :users
  end
  def self.down
  end
end
