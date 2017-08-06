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

  # without the optional params, we got the following error when update and create :
  # ActiveRecord::RecordInvalid (Validation failed: users must exist):
  belongs_to :users, optional: true


  # a task title is mandatory
  validates :title, presence: true

end
