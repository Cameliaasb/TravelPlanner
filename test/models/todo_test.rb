require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "Todo must have content" do
    todo = Todo.new(campaign: campaigns(:foo))
    assert_not todo.valid?, "Valid without content"
  end

  test "Todo must belong to campaign" do
    todo = Todo.new(content: "test-todo", user: users(:test))
    assert_not todo.valid?, "Valid without a campaign"
  end

  test "Todo is valid with valid attributes" do
    todo = Todo.new(content: "test-todo", campaign: campaigns(:foo), user: users(:test))
    assert todo.valid?, "Invalid with valid attributes"
  end

  test "Todo is not done by default" do
    todo = Todo.new(content: "test-todo", campaign: campaigns(:foo), user: users(:test))
    assert_equal todo.done, false
  end
end
