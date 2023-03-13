class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :submissions
  acts_as_favoritor
  has_one_attached :avatar
  has_one_attached :banner_picture
  has_many :exercices, through: :submissions

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def beginners_luck?
    submissions.validated.where(attempts_count: 1).any?
  end

  # def exp
  #   exercices.joins(:submissions).where(submissions: { validation: true }).map(&:exp).sum
  # end

  def completion_achievements
   #si current_user réussit 10, 50, 100 exercices.
   #alors il décroche un badge
  end


  def accuracy_achievements
    # submissions.validated.where(attempts_count: 1)
    #si current_user réussit 10 exercices avec un attempts_count: 1
    #alors il décroche un badge
  end

  def leaderboard_achievements_15
    #si current_user réussit a se classer dans les 15 premiers
    #alors il décroche un badge
  end


  def badge_achievements
    #si current_user réussit a avoir les badges suivants
    #alors il décroche un badge
  end
end

# Completion achievements: These could be based on the number of exercises a user completes on your website.
# You could have different levels of completion achievements for different milestones, such as completing 10, 50, or 100 exercises.

# Accuracy achievements: You could reward users who consistently get high accuracy rates on their exercises.
# For example, you could have achievements for users who get 100% accuracy on 10 exercises in a row, or for those who get a 90% or higher accuracy rate on 50 exercises.

# Leaderboard achievements: You could have achievements for users who make it onto the top of the leaderboard on your website, based on various metrics such as total points earned or number of exercises completed.

# Challenge achievements: You could have achievements for users who successfully complete specific challenge exercises that you create, such as a particularly difficult problem that requires advanced JavaScript knowledge.

# Badge achievements: You could have achievements for users who earn a certain number of badges on your website.
# For example, you could have a badge for users who complete exercises in different categories, or for those who complete a certain number of exercises in a single day.
