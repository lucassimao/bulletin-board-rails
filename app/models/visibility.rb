class Visibility < ApplicationRecord
  belongs_to :role, optional: true
  belongs_to :user, optional: true
  belongs_to :message
end
