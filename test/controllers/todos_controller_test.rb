require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_toto = campaigns(:campaign_toto)
    @campaign_tata = campaigns(:campaign_tata)
    @todo_toto = todos(:todo_toto)
    @todo_tata = todos(:todo_tata)
    @toto = users(:toto)
    login_as @toto
  end

  test "todo set up is OK" do
    get campaign_url(@campaign_toto)
    assert_response :success
    get campaign_url(@campaign_tata)
    assert_response :success
  end

  test "All todos are displayed in particular campaign" do
    get campaign_url(@campaign_toto)
    assert_select ".todo", /#{@campaign_toto.todos.first.content}/
    assert_select ".todo", /#{@campaign_toto.todos.last.content}/
  end

  test "Campaign owner can delete a todo" do
    get campaign_url(@campaign_toto)
    assert_select ".todo" do
      assert_select ".delete-btn"
    end
  end

  test "Only campaign owner can delete a todo" do
    login_as users(:tata)
    get campaign_url(@campaign_toto)
    assert_select ".todo" do
      assert_select ".delete-btn", count: 0
    end
  end

  test "Any user can create a todo within a campaign" do
    get campaign_url(@campaign_toto)

    assert_difference('Todo.count') do
      post todos_url, params: { todo: { content: "New todo", campaign_id: @campaign_toto.id } }
    end
  end
end
