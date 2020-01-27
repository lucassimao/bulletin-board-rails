class Organization < ApplicationRecord
    belongs_to :admin, class_name: 'User'
    accepts_nested_attributes_for :admin
    validates :name, presence: {message: "Organization name can't be blank"}

end
