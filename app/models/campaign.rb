class Campaign < ApplicationRecord
  # Only expert users can create campaigns
  has_many    :tags, dependent: :destroy
  has_many    :todos, dependent: :destroy
  has_many    :campaigncomments, dependent: :destroy
  has_many    :memberships, dependent: :destroy
  has_many    :members, through: :memberships

  belongs_to  :expert

  validates   :title, :estimated_duration, presence: true
end
