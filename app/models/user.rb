class User < ApplicationRecord
  has_secure_password
  has_many :user_roles
  belongs_to :organization, optional: true
  validates :email, presence: { message: "Email can't be blank" }
  validates :email, uniqueness: { message: "The email has already been taken" }, on: :create
  serialize :profiles, Array
  scope :received_messages, -> {
      Visibility.where(user: self).or(Visibility.where())
   }

  private

  ROLES = %w{ super_admin organization_admin user }

  public

  def roles
    sql_array = ["INNER JOIN user_roles ON user_roles.role_id = roles.id AND user_roles.user_id = ", id.to_s]
    sanitized_sql = sanitize_for_mass_assignment(sql_array)
    return Role.joins(sanitized_sql)
  end

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
