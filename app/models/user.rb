class User < ApplicationRecord
  has_secure_password
  serialize :profiles, Array

end
