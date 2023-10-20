require "test_helper"

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_toto = campaigns(:campaign_toto)
    @campaign_tata = campaigns(:campaign_tata)
    @toto = users(:toto)
    login_as @toto
  end

  test "should get all campaigns" do
    # toto is a member of all campaigns in fixtures
    get campaigns_url
    assert_response :success
    assert_select ".campaign" do
      assert_select ".title", @campaign_toto.title
      assert_select ".duration", @campaign_toto.estimated_duration.to_s
      assert_select ".tags", @campaign_toto.tags.first.title
      assert_select ".tags", @campaign_toto.tags.last.title

      assert_select ".title", @campaign_tata.title
      assert_select ".duration", @campaign_tata.estimated_duration.to_s
      assert_select ".tags", @campaign_tata.tags.first.title
      assert_select ".tags", @campaign_tata.tags.last.title
    end
  end

  test "should show one campaign" do
    get campaign_url(@campaign_toto)
    assert_response :success
    assert_select ".big-title", @campaign_toto.title
    assert_select ".duration", @campaign_toto.estimated_duration.to_s
  end

  test "should successfuly create campaign" do
    assert_difference('Campaign.count') do
      post campaigns_url, params: { campaign: { title: "New Campaign", estimated_duration: 10 } }
    end

    assert_redirected_to campaign_url(Campaign.last)
  end

  test "should update campaign" do
    patch campaign_url(@campaign_toto), params: { campaign: { title: "Updated Campaign" } }
    assert_redirected_to campaign_url(@campaign_toto)
    @campaign_toto.reload
    assert_equal "Updated Campaign", @campaign_toto.title
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete campaign_url(@campaign_toto)
    end

    assert_redirected_to campaigns_url
  end

  test "owner of campaign is a member" do
    post campaigns_url, params: { campaign: { title: "New Campaign", estimated_duration: 10 } }
    created_campaign = assigns(:campaign)
    assert_includes created_campaign.members, @toto
  end
end
