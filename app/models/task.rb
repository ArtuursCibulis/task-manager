class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :assigner, class_name: 'User', optional: true

  validates_presence_of :title, :status, :creator_id

  enum status: { pending: 'pending', in_progress: 'in progress', completed: 'completed' }
end
