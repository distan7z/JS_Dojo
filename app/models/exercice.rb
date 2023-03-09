class Exercice < ApplicationRecord
  has_many :tags
  has_many :submissions
  acts_as_favoritable
end
