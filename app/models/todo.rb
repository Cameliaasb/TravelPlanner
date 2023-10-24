class Todo < ApplicationRecord
  # Any user should be able to create a todo within a campaign
  belongs_to :campaign
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :tasks, dependent: :destroy

  validates  :content, presence: true, uniqueness: { scope: :campaign }
end
