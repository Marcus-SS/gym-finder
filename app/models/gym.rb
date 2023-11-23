class Gym < ApplicationRecord
  has_many :memberships
  has_many :reviews, dependent: :destroy

  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def get_average_rating
    return 0 if self.reviews.length == 0

    gym_average = 0
    self.reviews.each do |review|
      gym_average += review.rating
    end
    self.average_rating = gym_average / self.reviews.length
  end
end
