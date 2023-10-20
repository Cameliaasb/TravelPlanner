require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  test "membership must have a campaign and a user" do
    membership = Membership.new
    assert_not membership.save, "Saved the membership without attributes"
  end
end
