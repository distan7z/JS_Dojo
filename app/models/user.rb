class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :submissions
  has_one_attached :photo
  has_one_attached :banner
  before_save :downcase_country

  private

  def downcase_country
    self.country = country.downcase
  end
end
