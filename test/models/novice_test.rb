require "test_helper"

class NoviceTest < ActiveSupport::TestCase
  test "novice users must have attributes" do
    novice = Novice.new
    assert_not novice.save, "Saved the novice user without attributes"
  end

  test "Novice is a subclass of User" do
    assert Novice < User, "Novice should be a subclass of User"
  end
end
