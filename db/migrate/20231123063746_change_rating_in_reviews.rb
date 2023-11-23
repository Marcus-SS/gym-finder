class ChangeRatingInReviews < ActiveRecord::Migration[7.1]
  def change
    change_column :reviews, :rating, 'integer USING rating::integer'
  end
end
