require "test_helper"

class TagTest < ActiveSupport::TestCase
  test "tag must have a title" do
    tag = Tag.new(campaign: campaigns(:campaign_toto), expert: users(:toto))
    assert_not tag.valid?, "Valid without a title"
  end

  test "tag must belong to campaign" do
    tag = Tag.new(title: "test-tag", expert: users(:toto))
    assert_not tag.valid?, "Valid without a campaign"
  end
end
