class ChangeAddressGym < ActiveRecord::Migration[7.1]
  def change
    remove_column :gyms, :address, :string
    add_column :gyms, :address, :decimal, array: true, default: []
  end
end
