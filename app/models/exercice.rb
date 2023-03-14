class Exercice < ApplicationRecord
  has_many :tags
  has_many :submissions
  acts_as_favoritable

  def has_submission?(user)
    submissions.where(user: user).any?
  end

  def user_submission(user)
    submissions.where(user: user).first
  end

end
