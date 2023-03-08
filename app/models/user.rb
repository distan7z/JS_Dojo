class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :submissions
  has_one_attached :avatar
  has_one_attached :banner_picture

  def beginners_luck?
    submissions.validated.where(attempts_count: 1).any?
  end

end
