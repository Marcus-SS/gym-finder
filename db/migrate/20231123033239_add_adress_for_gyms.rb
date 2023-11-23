class AddAdressForGyms < ActiveRecord::Migration[7.1]
  def change
    add_column :gyms, :address, :string
  end
end
