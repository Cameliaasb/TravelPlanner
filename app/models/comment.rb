class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :todo

  validates  :title, presence: true
end
