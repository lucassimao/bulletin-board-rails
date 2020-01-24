class Organization < ApplicationRecord
    belongs_to :admin, class_name: 'User'
    accepts_nested_attributes_for :admin

end
