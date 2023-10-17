require "test_helper"

class UserTest < ActiveSupport::TestCase
  # A user with type ‘Novice’ has “email, password, username and status” as attributes.
  # A user of type ‘Expert’ has “email, password, username, status, profession, and service”.
  # The status attribute can have three different data values of “:qualified, :not_qualified,
  # :banned” .
  # ( hint​: We can have other user types, so minimize the use of db space as far as possible)
  # The status of the ‘Novice’ user can only be changed by the ‘Expert’.

  test "users must have attributes" do
    user = User.new
    assert_not user.save, "Saved the user without attributes"
  end

  test "A user can be of two types, either a Novice or an Expert" do
    user = User.new
    assert_respond_to user, :type, "User model should respond to 'type'"
  end

  test "A user has a username" do
    user = User.new
    assert_respond_to user, :username, "User model should respond to 'type'"
  end

end
