require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
    test "Organization 'one' should have 5 users" do
        assert_equal 5, organizations(:one).users.length
    end

    test "Organization 'one' should have 3 roles" do
        assert_equal 3, organizations(:one).roles.length
    end

    test "Organization 'two' should have no users" do
        assert_equal 0, organizations(:two).users.length
    end

    test "Organization 'two' should have no roles" do
        assert_equal 0, organizations(:two).roles.length
    end
end
