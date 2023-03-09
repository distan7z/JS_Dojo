class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :submissions
  acts_as_favoritor

  def beginners_luck?
    submissions.validated.where(attempts_count: 1).any?
  end
end
