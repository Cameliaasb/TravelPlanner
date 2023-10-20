class Expert < User
  has_many  :campaigns, dependent: :destroy
  has_many  :tags

  STATUS = ["starter", "master", "guru"]
  validates :status, presence: true, inclusion: { in: STATUS }
end
