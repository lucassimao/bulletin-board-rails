class User < ApplicationRecord
  has_secure_password validations: false
  validates :password, presence: { message: "Password can't be blank" }
  validates :email, presence: { message: "Email can't be blank" }, uniqueness: { message: "The email has already been taken" }
  serialize :profiles, Array

  private

  ROLES = %w{ super_admin organization_admin user }

  public

  ROLES.each_with_index do |role, index|
    define_method("#{role}?") { return self.profiles.include?(role) }
    define_method("#{role}=") do |value|
        if value 
            self.profiles << role
        else 
            self.profiles.delete(role)
        end
    end
  end
end
