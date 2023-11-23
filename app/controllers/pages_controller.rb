class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @gyms = Gym.all
    @gyms.first.get_average_rating
  end

  def dashboard
    @memberships = current_user.memberships
    @gyms = current_user.gyms
  end
end
