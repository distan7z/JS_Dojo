class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :exercice

  scope :validated, -> { where(validation: true) }

  def exp
    # calculate the experience points earned for this submission
    if self.validation
      # if the submission is valid, award experience points
      return exercice.exp
    else
      # if the submission is invalid, award 0 experience points
      0
    end
  end
end
