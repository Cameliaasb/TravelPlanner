require "test_helper"

class ExpertTest < ActiveSupport::TestCase
  # A user of type ‘Expert’ has “email, password, username, status, + profession, and service”.

  test "expert users must have attributes" do
    expert = Expert.new
    assert_not expert.save, "Saved the expert user without attributes"
  end

  test "Expert is a subclass of User" do
    assert Expert < User, "Expert should be a subclass of User"
  end

  test "User is Expert if type is Expert" do
    expert = users(:toto)
    assert_equal Expert, expert.class, "User should be an instance of Expert"
  end

  test "Is valid with valid attributes" do
    expert = users(:toto)
    assert expert.valid?, "Failed to save even with valid attributes"
  end

  test "Expert must have a valid status" do
    user = users(:toto)
    user.status = "invalid status"
    assert_not user.valid?, "Expert status should be valid"
  end
end
