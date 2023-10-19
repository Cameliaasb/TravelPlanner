class Comment < ApplicationRecord
  # Any user should be able to commment on a todo
  belongs_to :user
  belongs_to :todo

  validates  :title, presence: true
end
