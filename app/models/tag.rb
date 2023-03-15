class Tag < ApplicationRecord
  belongs_to :exercice
  # def self.search_by(title, exercice_id)
  #   ary.select{|obj| obj.name == name && obj.genre == genre || obj.year != year}
  # end
end
