class Decision < ApplicationRecord
  belongs_to :campaign
  validates :title, :content, :campaign_id, presence: true
end
