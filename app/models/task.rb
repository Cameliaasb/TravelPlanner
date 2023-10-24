class Task < ApplicationRecord
  belongs_to :todo

  validates :title, presence: true
end
