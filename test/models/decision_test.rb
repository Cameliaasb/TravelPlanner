require "test_helper"

class DecisionTest < ActiveSupport::TestCase
  test "decision must have title" do
    decision = Decision.new(content: "test", campaign: campaigns(:campaign_toto))
    assert_not decision.valid?, "Valid without title"
  end

  test "decision must belong to a campaign" do
    decision = Decision.new(title: "test decision", content: "this is a decision")
    assert_not decision.valid?, "Valid without a todo"
  end

  test "decision is valid with valid attributes" do
    decision = Decision.new(title: "test", campaign: campaigns(:campaign_toto), content: "this is a decision")
    assert decision.valid?, "Invalid with valid attributes"
  end
end
