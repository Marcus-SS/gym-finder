class FixNamesInGyms < ActiveRecord::Migration[7.1]
  def change
    remove_column :gyms, :string
    add_column :gyms, :average_rating, :integer
    add_column :gyms, :name, :string
  end

end
