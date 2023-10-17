class Campaign < ApplicationRecord
  has_many    :tags
  has_many    :todos
  has_many    :campaigncomments

  belongs_to  :expert

  validates   :title, :estimated_duration, presence: true
end
