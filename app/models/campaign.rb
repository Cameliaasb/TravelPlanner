class Campaign < ApplicationRecord
  has_many  :tags
  has_many  :todos
  validates :title, :estimated_duration, presence: true
end
