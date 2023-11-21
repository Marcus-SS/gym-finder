class ChangeReviewToAverageRatingInGyms < ActiveRecord::Migration[7.1]
  def change
    rename_column :gyms, :review, :average_rating
    change_column :gyms, :average_rating, :integer
  end
end
