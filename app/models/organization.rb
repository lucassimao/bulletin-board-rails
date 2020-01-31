class Organization < ApplicationRecord
    belongs_to :admin, class_name: 'User'
    accepts_nested_attributes_for :admin
    has_many :users
    has_many :roles
    validates :name, presence: {message: "Organization name can't be blank"}

end
