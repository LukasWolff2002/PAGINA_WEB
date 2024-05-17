class Design < ActiveRecord::Base
    has_many :boards
    validates :name, :type_of_attribute, presence: true
end