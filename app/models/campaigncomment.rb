class Campaigncomment < ApplicationRecord
  # Any user should be able to commment on a campaign
  belongs_to :campaign
  belongs_to :user

  validates  :title, presence: true
end
