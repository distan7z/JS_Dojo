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
  has_many :exercices, through: :submissions

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true


  def total_experience
    submissions.validated.includes(:exercice).sum(&:exp) + expx
  end

  def streak
    submissions.validated.where("created_at > ?", 1.day.ago).count
  end

  def beginners_luck?
    submissions.validated.where(attempts_count: 1).any?
  end

  def completion_achievements
    #si current_user réussit 10, 50, 100 exercices.
    #alors il décroche un Achievement
  end

  def accuracy_achievements
    #si current_user réussit 10 exercices avec un attempts_count: 1
    #alors il décroche un Achievement
  end

  def leaderboard_achievements_15
    #si current_user réussit a se classer dans les 15 premiers
    #alors il décroche un Achievement
  end

  def badge_achievements
    #si current_user réussit a avoir les Achievement précédent
    #alors il décroche un Achievement
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :country, :exp)
  end
end
