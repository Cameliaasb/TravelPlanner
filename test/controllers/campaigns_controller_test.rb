require "test_helper"

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:foo)
    @campaign_two = campaigns(:bar)
    @user = users(:toto)
    login_as @user
  end

  test "should get all campaigns" do
    get campaigns_url
    assert_response :success
    assert_select "div.campaign" do
      assert_select "div.title", @campaign.title
      assert_select "div.duration", @campaign.estimated_duration.to_s
      assert_select "div.title", @campaign_two.title
      assert_select "div.duration", @campaign_two.estimated_duration.to_s
    end
  end

  test "should show one campaign" do
    get campaign_url(@campaign)
    assert_response :success
    assert_select "div.big-title", @campaign.title
    assert_select "div.duration", @campaign.estimated_duration.to_s
  end

  test "should successfuly create campaign" do
    assert_difference('Campaign.count') do
      post campaigns_url, params: { campaign: { title: "New Campaign", estimated_duration: 10 } }
    end

    assert_redirected_to campaign_url(Campaign.last)
  end

  test "should update campaign" do
    patch campaign_url(@campaign), params: { campaign: { title: "Updated Campaign" } }
    assert_redirected_to campaign_url(@campaign)
    @campaign.reload
    assert_equal "Updated Campaign", @campaign.title
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete campaign_url(@campaign)
    end

    assert_redirected_to campaigns_url
  end

end
