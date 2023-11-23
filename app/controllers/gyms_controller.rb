class GymsController < ApplicationController
  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    @gym.user = current_user
    if @gym.save
      redirect_to dashboard_path, notice: 'Gym was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @gyms = Gym.where('city ILIKE ?', "%#{params[:query]}%")

    @markers = @gyms.geocoded.map do |gym|
      {
        lat: gym.lat,
        lng: gym.lng
      }
    end
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    if @gym.update(gym_params)
      redirect_to @gym, notice: 'Gym was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy
    redirect_to gyms_url, notice: 'Gym was successfully destroyed.'
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :city, :address, :lat, :lng, :description, :average_rating, :price, :preview)
  end
end
