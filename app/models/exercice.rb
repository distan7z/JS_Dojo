class Exercice < ApplicationRecord
  has_many :tags
  has_many :submissions
end
