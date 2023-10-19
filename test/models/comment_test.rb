require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "comment must have title" do
    todo = Todo.new(content: "test", campaign: campaigns(:campaign_toto), user: users(:test))
    comment = Comment.new(todo: todo, user: users(:test))
    assert_not comment.valid?, "Valid without title"
  end

  test "comment must belong to a todo" do
    comment = Comment.new(title: "test-comment", user: users(:test))
    assert_not comment.valid?, "Valid without a todo"
  end

  test "comment is valid with valid attributes" do
    todo = Todo.new(content: "test", campaign: campaigns(:campaign_toto), user: users(:test))
    comment = Comment.new(title: "test-comment", todo: todo, user: users(:test))
    assert comment.valid?, "Invalid with valid attributes"
  end
end
