class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  STATUS = ["qualified", "not_qualified", "banned"]
  validates :status, inclusion: { in: STATUS }

  has_many :todos, dependent: :destroy
  has_many :campaigncomments, dependent: :destroy
  has_many :comments, dependent: :destroy
end
