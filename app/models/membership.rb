class Membership < ApplicationRecord
  # to avoid confusion between user who is the owner and users who are the members
  belongs_to :member, class_name: "User", foreign_key: "user_id"

  # to avoid confusion between the campaign user owns and the ones he is a member in
  belongs_to :trip, class_name: "Campaign", foreign_key: "campaign_id"
end
