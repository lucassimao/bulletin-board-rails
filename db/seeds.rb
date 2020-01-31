# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new(email:'admin@organization.com', password: '123')
admin.profiles = ['organization_admin']
admin.save!

organization = Organization.create!(admin: admin,name: 'Test organization' )


all_users_role = Role.create!(description: 'All users', organization: organization)
internal_users_role = Role.create!(description: 'Internal users', organization: organization)
external_users_role = Role.create!(description: 'External users',organization: organization)

admin.user_roles << UserRole.new(role: all_users_role)
admin.user_roles << UserRole.new(role: internal_users_role)
admin.organization = organization
admin.save!

user1 = User.create(email: 'user1@organization.com', password: '456')
user1.profiles = ['user']
user1.organization = organization
user1.user_roles << UserRole.new(role: internal_users_role)
user1.save!


msg_for_internal_users = Message.create!(text: 'Msg for internal users only', author: admin)
msg_for_all_users = Message.create!(text: 'Msg for All users', author: admin)

Visibility.create!(message: msg_for_internal_users, role: internal_users_role)
Visibility.create!(message: msg_for_all_users, role: all_users_role)
