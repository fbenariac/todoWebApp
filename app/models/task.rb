# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  completed   :boolean
#  order       :integer
#  due_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
end
