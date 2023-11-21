class CreateGyms < ActiveRecord::Migration[7.1]
  def change
    create_table :gyms do |t|
      t.string :address
      t.string :description
      t.integer :string
      t.integer :price
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
