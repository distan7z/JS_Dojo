class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :submissions
  has_many :exercices, through: :submissions
  acts_as_favoritor
  has_one_attached :avatar
  has_one_attached :banner_picture

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def streak
    submissions.validated.where("created_at > ?", 1.day.ago).count
  end


  def beginners_luck?
    submissions.validated.where(attempts_count: 1).any?
  end
end
