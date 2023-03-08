class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :exercice

  scope :validated, -> { where(validation: true) }
end
