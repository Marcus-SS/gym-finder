class MembershipsController < ApplicationController
  before_action :set_gym, only: %i[new create]

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.gym = @gym
    @membership.user = current_user
    if @membership.save
      redirect_to dashboard_path, notice: 'Membership successfully registered.'
    else
      render :new, status: :unprocessable_entity
    end
  end 

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to gym_path(@membership.gym), status: :see_other
  end

  private

  def set_gym
    @gym = Gym.find(params[:gym_id])
  end

  def membership_params
    params.require(:membership).permit(:start_date, :end_date)
  end
end
