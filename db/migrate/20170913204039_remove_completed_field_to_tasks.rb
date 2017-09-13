# 20170913204039 remove_completed_field_to_tasks
class RemoveCompletedFieldToTasks < ActiveRecord::Migration[5.1]

  def up
    remove_column :tasks, :completed
  end

  def down
    add_column :tasks, :completed, :boolean, default: false
  end

end
