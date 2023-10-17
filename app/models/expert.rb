class Expert < User
  validates :profession, :service, presence: true
end
