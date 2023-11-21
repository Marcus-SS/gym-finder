class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships do |t|
      t.string :date
      t.references :user, null: false, foreign_key: true
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
