class WorkUser < ActiveRecord::Base
    belongs_to :user
    belongs_to :work_team
  
    validates :user_id, :work_team_id, presence: true
  end