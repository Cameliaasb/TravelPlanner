require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  test "campaign must have attributes" do
    campaign = Campaign.new
    assert_not campaign.valid?, "Valid without attributes"
  end

  test "campaign is valid with valid attributes" do
    campaign = campaigns(:foo)
    assert campaign.valid?, "Invalid even with all attributes"
  end
end
