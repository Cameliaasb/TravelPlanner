class Expert < User
  has_many  :campaigns, dependent: :destroy
  has_many  :tags

  validates :profession, :service, presence: true
end
