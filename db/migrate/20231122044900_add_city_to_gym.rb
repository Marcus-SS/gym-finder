class AddCityToGym < ActiveRecord::Migration[7.1]
  def change
    add_column :gyms, :city, :string
  end
end
