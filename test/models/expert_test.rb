require "test_helper"

class ExpertTest < ActiveSupport::TestCase
  test "expert users must have attributes" do
    expert = Expert.new
    assert_not expert.save, "Saved the expert user without attributes"
  end

  test "Expert is a subclass of User" do
    assert Expert < User, "Expert should be a subclass of User"
  end
end
