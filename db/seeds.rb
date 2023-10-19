User.destroy_all

puts "--------------Creating users--------------"
user_one = User.new(
  email: "test@mail.com", password: "azerty", username: "test",
  status: "not_qualified"
)
p user_one.save ? "user_one OK" : "Failed to save user_one"

user_two = User.new(
  email: "toto@mail.com", password: "azerty", username: "toto",
  status: "qualified", type: "Expert", profession: "Dev", service: "IT"
)
p user_two.save ? "user_two OK" : "Failed to save user_two"

user_three = User.new(
  email: "tata@mail.com", password: "azerty", username: "tata",
  status: "qualified", type: "Expert", profession: "Dev", service: "IT"
)
p user_three.save ? "user_three OK" : "Failed to save user_three"


puts "--------------Creating campaigns--------------"
campaign_one = Campaign.new(
  title: "Campaign One", estimated_duration: 2, expert: user_two
)
p campaign_one.save ? "campaign_one OK" : "Failed to save campaign_one"

campaign_two = Campaign.new(
  title: "Campaign Two", estimated_duration: 3, expert: user_three
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
