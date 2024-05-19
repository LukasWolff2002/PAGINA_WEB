class User < ActiveRecord::Base
  has_many :work_users
  has_many :work_teams, through: :work_users
  has_many :boards, through: :work_users, source: :work_team

  has_many :created_tasks, class_name: 'Task', foreign_key: 'creator_id'
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id'

  validates :first_name, :last_name, :position, :email, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "debe ser un correo electrónico válido" }
  validates :password, length: { minimum: 6, message: "debe tener al menos 6 caracteres" }

  def full_name
    "#{first_name} #{last_name}"
  end
end