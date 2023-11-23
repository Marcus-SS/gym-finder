class AddDateToMemberships < ActiveRecord::Migration[7.1]
  def change
    add_column :memberships, :start_date, :date
    add_column :memberships, :end_date, :date
  end
end
