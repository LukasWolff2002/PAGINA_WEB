class WorkTeam < ActiveRecord::Base
    has_many :work_users
    has_many :users, through: :work_users
  
    has_many :boards
  
    validates :name, presence: true

    accepts_nested_attributes_for :users
  end