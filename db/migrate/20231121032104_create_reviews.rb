class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :rating
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :gym, null: false, foreign_key: true


      t.timestamps
    end
  end
end
