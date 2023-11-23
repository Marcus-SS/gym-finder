class Gym < ApplicationRecord
  has_many :memberships
  has_many :reviews, dependent: :destroy

  belongs_to :user

  def get_average_rating
    gym_average = 0
    self.reviews.each do |review|
      gym_average += review.rating
    end
    self.average_rating = gym_average / self.reviews.length
  end
end
