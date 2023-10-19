class Tag < ApplicationRecord
  # Only expert users can add (or delete) campaign tags
  belongs_to :campaign
  belongs_to :expert

  validates  :title, presence: true
end
