class MakeChangesToProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :description, :text
    change_column :products, :price, :decimal, precision: 10, scale: 2
    add_column :products, :in_stock, :boolean
  end
end
