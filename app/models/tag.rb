class Tag < ApplicationRecord
  belongs_to :campaign
  belongs_to :expert
  validates  :title, presence: true
end
