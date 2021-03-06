# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  order       :integer
#  due_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  status      :string(255)      default(NULL)
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test 'get statuses' do
    expected_status = {
      no_one: '',
      todo:   'todo',
      wip:    'wip',
      done:   'done'
    }

    assert expected_status, Task.statuses
  end

end
