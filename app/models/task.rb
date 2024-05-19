class Task < ActiveRecord::Base
  belongs_to :board # relación uno a muchos con Board

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id', optional: false
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', optional: false

  validates :title, :description, :status, :priority, presence: true

  enum status: { 'TO DO': 0, 'WIP': 1, 'DONE': 2 }
  end