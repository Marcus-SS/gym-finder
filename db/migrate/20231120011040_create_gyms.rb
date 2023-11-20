class CreateGyms < ActiveRecord::Migration[7.1]
  def change
    create_table :gyms do |t|
      t.string :address
      t.string :description
      t.string :review
      t.integer :price

      t.timestamps
    end
  end
end
