require "test_helper"

class ExpertTest < ActiveSupport::TestCase
  # A user of type ‘Expert’ has “email, password, username, status, profession, and service”.

  test "expert users must have attributes" do
    expert = Expert.new
    assert_not expert.save, "Saved the expert user without attributes"
  end

  test "Expert is a subclass of User" do
    assert Expert < User, "Expert should be a subclass of User"
  end

  test "Expert should have a profession" do
    expert = users(:test)
    expertt.type = "Expert"
    expert.service = "IT"
    assert_not expert.valid?
  end

  test "Expert should have a service" do
    expert = users(:test)
    expert.type = "Expert"
    expert.profession = "IT"
    assert_not expert.valid?
  end
end
