class AddPreviewToGyms < ActiveRecord::Migration[7.1]
  def change
    add_column :gyms, :preview, :string
  end
end
