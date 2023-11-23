class ChangeRatingToIntegerAgainForReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :lat
    add_column :reviews, :rating, :integer
  end
end
