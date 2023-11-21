class Gym < ApplicationRecord
  has_many :memberships
  has_many :reviews
  belongs_to :user
end
