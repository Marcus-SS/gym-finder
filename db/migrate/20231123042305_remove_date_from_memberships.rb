class RemoveDateFromMemberships < ActiveRecord::Migration[7.1]
  def change
    remove_column :memberships, :date, :string
  end
end
