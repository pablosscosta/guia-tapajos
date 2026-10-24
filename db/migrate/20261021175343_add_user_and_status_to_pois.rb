class AddUserAndStatusToPois < ActiveRecord::Migration[7.0]
  def change
    add_reference :pois, :user, foreign_key: true, null: true
    add_column :pois, :status, :integer, default: 1, null: false
  end
end