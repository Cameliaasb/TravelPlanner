require "test_helper"

class CampaigncommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_one = campaigns(:campaign_toto)
    @campaign_two = campaigns(:campaign_tata)
    @novice_user = users(:test)
    @expert_user = users(:toto)
  end

  test "setup is OK for testing" do
    login_as @novice_user
    get campaign_url(@campaign_one)
    assert_response :success
  end

  test "Any user can comment on a campaign" do
    login_as @novice_user
    get campaign_url(@campaign_one)
    assert_select ".btn", text: "New comment"

    login_as @expert_user
    get campaign_url(@campaign_one)
    assert_select ".btn", text: "New comment"
  end

  test "Campaign owner can delete a comment" do
    login_as @expert_user
    get campaign_url(@campaign_one)

    assert_select "div.comment" do
      assert_select "a[data-method='delete']"
    end
  end

  test "Only campaign owner can delete a comment" do
    login_as @expert_user
    get campaign_url(@campaign_two)

    assert_select "div.comment" do
      assert_no_select "a[data-method='delete']"
    end
  end

end
