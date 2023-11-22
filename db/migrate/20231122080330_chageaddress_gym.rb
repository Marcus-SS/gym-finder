class ChageaddressGym < ActiveRecord::Migration[7.1]
  def change
    remove_column :gyms, :address
    add_column :gyms, :lat, :string
    add_column :gyms, :lng, :string
  end
end
