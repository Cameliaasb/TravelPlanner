require "test_helper"

class CampaigncommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_toto = campaigns(:campaign_toto)
    @campaign_tata = campaigns(:campaign_tata)
    @novice_user = users(:test)
    @toto_expert_user = users(:toto)
  end

  test "setup is OK for testing" do
    login_as @novice_user
    get campaign_url(@campaign_toto)
    assert_response :success
  end

  test "Any user can comment on a campaign" do
    login_as @novice_user
    get campaign_url(@campaign_toto)
    assert_select "input[type=submit][value='New comment']"
    assert_difference('Campaigncomment.count') do
      post campaign_campaigncomments_path(@campaign_toto), params: { campaigncomment: { title: "New comment", campaign_id: @campaign_toto.id } }
    end

    login_as @toto_expert_user
    get campaign_url(@campaign_toto)
    assert_select "input[type=submit][value='New comment']"
    assert_difference('Campaigncomment.count') do
      post campaign_campaigncomments_path(@campaign_toto), params: { campaigncomment: { title: "New comment", campaign_id: @campaign_toto.id } }
    end
  end

  test "Campaign owner can delete a comment" do
    login_as @toto_expert_user
    get campaign_url(@campaign_toto)

    assert_select ".comment" do
      assert_select ".delete-btn"
    end
  end

  test "Only campaign owner can delete a comment" do
    login_as @toto_expert_user
    get campaign_url(@campaign_tata)

    assert_select ".comment" do
      assert_select ".delete-btn", count: 0
    end
  end

end
