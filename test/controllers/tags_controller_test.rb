require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_toto = campaigns(:campaign_toto)
    @campaign_tata = campaigns(:campaign_tata)
    @toto = users(:toto)
    login_as @toto
  end

  test "should get all tags in index" do
    get campaigns_url
    assert_response :success
    assert_select ".tags", @campaign_toto.tags.first.title
    assert_select ".tags", @campaign_toto.tags.last.title
    assert_select ".tags", @campaign_tata.tags.first.title
    assert_select ".tags", @campaign_tata.tags.last.title
  end

  test "should get all tags of particular campaign" do
    # a campaign the user doesn't own => tags are only the title
    get campaign_url(@campaign_tata)
    assert_response :success
    assert_select ".tags", @campaign_tata.tags.first.title
    assert_select ".tags", @campaign_tata.tags.last.title
  end

  test "should allow owner to delete tags" do
    get campaign_url(@campaign_toto)
    assert_response :success
    # to make sure it includes the tag title (not strictly equal) AND the delete btn
    assert_select ".tags", /#{@campaign_toto.tags.first.title}/
    assert_select ".tag" do
      assert_select ".delete-btn"
    end
  end
end
