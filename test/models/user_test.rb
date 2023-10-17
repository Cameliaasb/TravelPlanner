require "test_helper"

class UserTest < ActiveSupport::TestCase
  # A user with type ‘Novice’ has “email, password, username and status” as attributes.
  # A user of type ‘Expert’ has “email, password, username, status, profession, and service”.
  # The status attribute can have three different data values of “:qualified, :not_qualified,
  # :banned”

  test "users must have attributes" do
    user = User.new
    assert_not user.save, "Saved the user without attributes"
  end

  test "A user can be of two types, either a Novice or an Expert" do
    user = User.new
    assert_respond_to user, :type, "User model should respond to 'type'"
  end

  test "A user must have a valid status" do
    user = users(:test)
    user.status = "invalid status"
    assert_not user.valid?, "User status should be valid"
  end
end
