class Tag < ApplicationRecord
  belongs_to :exercice

  def self.titles
    Tag.all.pluck(:title).uniq.map do |title|
      [title, title]
    end
  end
end
