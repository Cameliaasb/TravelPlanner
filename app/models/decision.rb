class Decision < ApplicationRecord
  belongs_to  :campaign
  belongs_to  :expert
  validates   :title, :content, presence: true
end
