class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships
  has_many :reviews
  has_many :gyms

  def owner?
    !gyms.empty?
  end

  def owner_of_gym?(gym)
    gym.user == self
  end


end
