require "test_helper"

class CampaigncommentTest < ActiveSupport::TestCase
  test "Campaign comment must have title" do
    campaigncomment = Campaigncomment.new(campaign: campaigns(:foo), user: users(:test))
    assert_not campaigncomment.valid?, "Valid without title"
  end

  test "Campaigncomment must belong to campaign" do
    campaigncomment = Campaigncomment.new(title: "test-campaigncomment", user: users(:test))
    assert_not campaigncomment.valid?, "Valid without a campaign"
  end

  test "Campaigncomment is valid with valid attributes" do
    campaigncomment = Campaigncomment.new(title: "test-campaigncomment", campaign: campaigns(:foo), user: users(:test))
    assert campaigncomment.valid?, "Invalid with valid attributes"
  end
end
