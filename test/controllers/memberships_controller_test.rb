require "test_helper"

class MembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_tata = campaigns(:campaign_tata)
    @expert = users(:toto) # member in :campaign_tata and :campaign_toto
    @novice = users(:test) # member in :campaign_toto
  end

  test "should get all trips where novice user is member" do
    login_as @novice
    get campaigns_url
    assert_response :success

    # Novice users can't create a campaign,
    # so the .campaign should match exactly the nb of campaigns they are members in
    assert_equal css_select(".campaign").count, @novice.trips.count
  end

  test "should get all trips where expert user is member" do
    login_as @expert
    get campaigns_url
    assert_response :success

    # Expert users can create a campaign,
    # so the .campaign should match the nb of campaigns they are members in + campaign#new
    assert_equal css_select(".campaign").count, (@expert.trips.count + 1)
  end


  test "should allow members to see the detailed show (informations / todos / chat)" do
    login_as @expert
    get campaign_url(@campaign_tata)
    assert_response :success
    assert_select ".tags"
    assert_select ".decisions"
    assert_select ".comments"
    assert_select ".todos"
  end

  test "should not allow non members to see the detailed show (informations / todos / chat)" do
    login_as @novice
    get campaign_url(@campaign_tata)
    assert_response :success
    assert_select ".tags"
    assert_equal css_select(".decisions").count, 0
    assert_equal css_select(".comments").count, 0
    assert_equal css_select(".todos").count, 0
  end


end
