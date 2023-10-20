require "test_helper"

class DecisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_tata = campaigns(:campaign_tata)
    @expert = users(:toto)
    @novice = users(:test)
  end

  test "should get all decisions of particular campaign" do
    # decisions are only the title and content for non expert users
    login_as @novice
    get campaign_url(@campaign_tata)
    assert_response :success
    assert_select ".decision", /#{@campaign_tata.decisions.first.title}/
    assert_select ".decision", /#{@campaign_tata.decisions.first.content}/
    assert_select ".decision", /#{@campaign_tata.decisions.last.title}/
    assert_select ".decision", /#{@campaign_tata.decisions.last.content}/
  end

  test "should allow experts to modify or delete decision" do
    login_as @expert
    get campaign_url(@campaign_tata)
    assert_response :success
    # to make sure it includes the delete btn for experts
    assert_select ".decision" do
      assert_select ".delete-btn"
      assert_select ".edit-btn"
    end
  end

  test "experts can create decision" do
    login_as @expert
    get campaign_url(@campaign_tata)
    assert_response :success
    assert_difference('Decision.count') do
      post campaign_decisions_path(@campaign_tata), params: { decision: { title: "New decision", content: "This is a decision", campaign_id: @campaign_tata.id} }
    end
  end
end
