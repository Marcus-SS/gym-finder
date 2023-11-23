class ChangeRatingToIntegerForReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :rating
    add_column :reviews, :lat, :integer
  end
end
