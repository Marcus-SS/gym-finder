class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @gyms = Gym.all
    @gyms.first.get_average_rating
  end


end
