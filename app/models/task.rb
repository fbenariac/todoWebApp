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

  belongs_to :users

  # a task title is mandatory
  validates :title, presence: true

end
