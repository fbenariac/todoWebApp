# 20170912163446 add_status_field_to_task
class AddStatusFieldToTask < ActiveRecord::Migration[5.1]
  
  def up
    add_column :tasks, :status, :string, default: 'noone'
  end
  
  def down
    remove_column :tasks, :status    
  end

end