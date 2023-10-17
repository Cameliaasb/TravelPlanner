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
    assert_equal Expert, expert.class, "User should become an instance of Expert"
    assert_not expert.valid?, "Expert should have profession and service attributes"
  end

  test "Expert should have profession and service attributes" do
    expert = users(:toto)
    expert.profession = "Testor"
    expert.service = "IT"
    assert expert.valid?, "Expert should have profession and service attributes"
  end

  test "Expert should have a service" do
    expert = users(:toto)
    expert.profession = "IT"
    assert_not expert.valid?
  end

  test "Expert should have a profession" do
    expert = users(:toto)
    expert.service = "IT"
    assert_not expert.valid?
  end
end
