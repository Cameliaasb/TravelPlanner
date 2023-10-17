class Expert < User
  has_many  :campaigns
  has_many  :tags

  validates :profession, :service, presence: true
end
