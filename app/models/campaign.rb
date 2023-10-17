class Campaign < ApplicationRecord
  has_many  :tags
  validates :title, :estimated_duration, presence: true
end
