class Message < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :visibilities
  scope :get_all_messages_to_user, ->(user) {
            return Message.joins(:visibilities)
                    .where(visibilities: {user: user})
                    .or(Message.joins(:visibilities)
                                .where(visibilities: {role: user.user_roles.select(:role_id)}))
        }
end
