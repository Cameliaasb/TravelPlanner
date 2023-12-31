class Campaign < ApplicationRecord
  # Only expert users can create campaigns
  has_one_attached :photo

  has_many    :tags, dependent: :destroy
  has_many    :todos, dependent: :destroy
  has_many    :campaigncomments, dependent: :destroy
  has_many    :decisions, dependent: :destroy
  has_many    :memberships, dependent: :destroy
  has_many    :members, through: :memberships

  belongs_to  :expert

  validates   :title, presence: true
end
