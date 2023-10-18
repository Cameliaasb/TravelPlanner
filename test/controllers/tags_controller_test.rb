require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:foo)
    @campaign_two = campaigns(:bar)
    @user = users(:toto)
    login_as @user
  end

  test "should get all tags" do
    get campaigns_url
    assert_response :success
    assert_select "div.tags", @campaign.tags.first.title
    assert_select "div.tags", @campaign.tags.last.title
    assert_select "div.tags", @campaign_two.tags.first.title
    assert_select "div.tags", @campaign_two.tags.last.title
  end

  test "should get all tags of particular campaign" do
    # a campaign the user doesn't own => tags are only the title
    get campaign_url(@campaign_two)
    assert_response :success
    assert_select "div.tags", @campaign_two.tags.first.title
    assert_select "div.tags", @campaign_two.tags.last.title
  end

  test "should get allow owner to delete tags" do
    get campaign_url(@campaign)
    assert_response :success
    # to make sure it includes the tag title (not strictly equal) AND the delete btn
    assert_select "div.tags", /#{@campaign.tags.first.title}/
    assert_select "div.delete-btn"
  end
end
