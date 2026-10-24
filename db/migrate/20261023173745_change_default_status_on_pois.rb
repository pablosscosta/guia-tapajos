class ChangeDefaultStatusOnPois < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pois, :status, from: 1, to: 0
  end
end