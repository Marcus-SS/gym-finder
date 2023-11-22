class AddCoordinatesToGyms < ActiveRecord::Migration[7.1]
  def change
    add_column :gyms, :latitude, :float
    add_column :gyms, :longitude, :float
  end
end
