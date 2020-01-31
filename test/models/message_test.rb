require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "rh user should read two messages" do
    u = users(:rhuser)
    messages = Message.get_all_messages_to_user(u)
    assert_equal 1, messages.length
    assert_equal messages[0], messages(:meeting_msg)
  end

  test "accountant should see only 1 message" do
    u = users(:accountant_user)
    messages = Message.get_all_messages_to_user(u)
    assert_equal 1, messages.length
    assert_equal messages[0], messages(:tax_update_msg)
  end

  test "admin user should see two messages" do
    u = users(:organization_admin)
    messages = Message.get_all_messages_to_user(u)
    assert_equal 2, messages.length
  end

  test "marketing user shouldn't see any message" do
    u = users(:marketing_user)
    messages = Message.get_all_messages_to_user(u)
    assert_equal 0, messages.length
  end  

  test "secretary should see a single msg" do
    u = users(:secretary)
    messages = Message.get_all_messages_to_user(u)
    assert_equal 1, messages.length
    assert_equal messages[0], messages(:be_on_time_msg)
  end
end
