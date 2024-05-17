class Board < ActiveRecord::Base
  belongs_to :work_team
  belongs_to :design, optional: true

  has_many :tasks
  validates :name, :description, presence: true

  

end