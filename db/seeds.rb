User.destroy_all

puts "--------------Creating users--------------"
user_one = User.new(
  email: "test@gmail.com", password: "azerty", username: "User1"
)
p user_one.save ? "user_one OK" : "Failed to save user_one"

user_two = User.new(
  email: "toto@gmail.com", password: "azerty", username: "User2",
  status: "guru", type: "Expert"
)
p user_two.save ? "user_two OK" : "Failed to save user_two"

user_three = User.new(
  email: "tata@gmail.com", password: "azerty", username: "User3",
  status: "master", type: "Expert"
)
p user_three.save ? "user_three OK" : "Failed to save user_three"


puts "--------------Creating campaigns--------------"
campaign_one = Campaign.new(
  title: "Campaign One", description: "A week end in the sun",
  expert: user_two
)
p campaign_one.save ? "campaign_one OK" : "Failed to save campaign_one"

campaign_two = Campaign.new(
  title: "Campaign Two", description: "A week end at sea",
  expert: user_three
)
p campaign_two.save ? "campaign_two OK" : "Failed to save campaign_two"


puts "--------------Creating tags--------------"
tag_one = Tag.new(
  title: "Tag one", campaign: campaign_one, expert: user_three
)
p tag_one.save ? "tag_one OK" : "Failed to save tag_one"

tag_two = Tag.new(
  title: "Tag two", campaign: campaign_one, expert: user_three
)
p tag_two.save ? "tag_two OK" : "Failed to save tag_two"


puts "--------------Creating todos--------------"
todo = Todo.new(
  campaign: campaign_one, user: user_one, content: "test todo"
)
p todo.save ? "todo OK" : "Failed to save todo"
