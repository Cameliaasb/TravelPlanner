class Expert < User
  has_many  :campaigns, dependent: :destroy
  has_many  :tags
  has_many  :decisions

  STATUS = ["starter", "master", "guru"]
  validates :status, presence: true, inclusion: { in: STATUS }
end
