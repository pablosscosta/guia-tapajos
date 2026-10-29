class RemoveCategoryFromPois < ActiveRecord::Migration[7.1]
  def change
    remove_column :pois, :category, :string
  end
end
