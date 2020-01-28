require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be able to asign the profile super_admin" do
    u = User.new(password: '123', email: 'u1@gmail.com')

    assert_not u.super_admin?
    u.super_admin = true

    assert u.super_admin?
    u.save!

    assert_equal User.find(u.id).profiles, ['super_admin']
  end

  test "should be able to assign the profile organization_admin" do
    u = User.new(password: '123', email: 'u1@gmail.com')
    assert_not u.organization_admin?
    u.organization_admin = true
    assert u.organization_admin?

    u.save!
    assert_equal User.find(u.id).profiles, ['organization_admin']
  end

  test "should be able to assign the profile user" do
    u = User.new(password: '123', email: 'u1@gmail.com')

    assert_not u.user?
    u.user = true
    assert u.user?

    u.save!
    assert_equal User.find(u.id).profiles, ['user']
  end
end
