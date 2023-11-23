class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @gyms = Gym.all
  end

  def dashboard
    @memberships = current_user.memberships
  end
end
