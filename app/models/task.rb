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

class Task < ApplicationRecord

  # has papertrail versionning hook ;-)
  has_paper_trail

  # Task belongs to only one user. Optionnal is about test bug TOFIX
  belongs_to :user, optional: true

  # A task title is mandatory
  validates :title, presence: true

  # define statuses
  enum status: {
    no_one: '',
    todo: 'todo',
    wip: 'wip',
    done: 'done'
  }

end
