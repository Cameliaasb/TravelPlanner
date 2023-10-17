class Todo < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  validates  :content, presence: true
end
