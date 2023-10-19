require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_toto = campaigns(:campaign_toto)
    @todo = todos(:todo_tata)
    @novice_user = users(:test)
    @expert_user = users(:toto)
  end

  test "setup is OK " do
    login_as @novice_user
    get campaign_url(@campaign_toto)
    assert_response :success
  end

  test "Any user can comment on a todo" do
    login_as @novice_user
    get campaign_url(@campaign_toto)
    assert_difference('Comment.count') do
      post todo_comments_path(@todo), params: { comment: { title: "New comment" } }
    end

    login_as @expert_user
    get campaign_url(@campaign_toto)
    assert_difference('Comment.count') do
      post todo_comments_path(@todo), params: { comment: { title: "New comment" } }
    end
  end

  test "Campaign owner can delete a comment" do
    login_as @expert_user
    get campaign_url(@campaign_toto)

    assert_select ".todo.comment" do
      assert_select ".delete-btn"
    end
  end

  test "Only campaign owner can delete a comment" do
    login_as @novice_user
    get campaign_url(@campaign_toto)

    assert_select ".todo.comment" do
      assert_select ".delete-btn", count: 0
    end
  end
end
