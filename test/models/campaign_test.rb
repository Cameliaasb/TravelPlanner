require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  test "campaign must have attributes" do
    campaign = Campaign.new
    assert_not campaign.valid?, "Valid without attributes"
  end

  test "campaign is valid with valid attributes" do
    campaign = campaigns(:foo)
    campaign.expert = users(:toto)
    assert campaign.valid?, "Invalid even with all attributes"
  end

  test "campaign has a an expert user" do
    campaign = campaigns(:foo)
    assert_not campaign.valid?, "Valid without expert"
  end
end
