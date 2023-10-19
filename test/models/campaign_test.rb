require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  test "campaign must have attributes" do
    campaign = Campaign.new
    assert_not campaign.valid?, "Valid without attributes"
  end

  test "campaign is valid with valid attributes" do
    campaign = campaigns(:campaign_toto)
    assert campaign.valid?, "Invalid even with all attributes"
  end

  test "campaign has a an expert user" do
    campaign = campaigns(:campaign_toto)
    campaign.expert = nil
    assert_not campaign.valid?, "Valid without an expert"
  end
end
