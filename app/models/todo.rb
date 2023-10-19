class Todo < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  has_many   :comments, dependent: :destroy

  validates  :content, presence: true
end
