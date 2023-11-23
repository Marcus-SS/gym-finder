class ReviewsController < ApplicationController
  before_action :set_gym, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.gym = @gym
    @review.user = current_user
    if @review.save notice: 'Review was successfully added.'
      redirect_to gym_path(@gym)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to gym_path(@review.gym), status: :see_other
  end

  private

  def set_gym
    @gym = Gym.find(params[:gym_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
