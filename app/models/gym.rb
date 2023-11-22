class Gym < ApplicationRecord
  has_many :memberships
  has_many :reviews, dependent: :destroy

  belongs_to :user

end
