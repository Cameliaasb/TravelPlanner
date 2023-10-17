require "test_helper"

class NoviceTest < ActiveSupport::TestCase
  # A user with type ‘Novice’ has “email, password, username and status” as attributes.
  # The status of the ‘Novice’ user can only be changed by the ‘Expert’.

  test "novice users must have attributes" do
    novice = Novice.new
    assert_not novice.save, "Saved the novice user without attributes"
  end

  test "Novice is a subclass of User" do
    assert Novice < User, "Novice should be a subclass of User"
  end
end
