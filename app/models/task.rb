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
#  user_id     :integer
#

class Task < ApplicationRecord

  # has papertrail versionning hook ;-)
  has_paper_trail

  # without the optional params, we got the following error when update and create :
  # ActiveRecord::RecordInvalid (Validation failed: users must exist):
  
  # Task belongs to only one user. Optionnal is about test bug TOFIX
  belongs_to :user, optional: true

  # A task title is mandatory
  validates :title, presence: true

end
