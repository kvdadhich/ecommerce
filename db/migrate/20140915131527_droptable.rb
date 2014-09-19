class Droptable < ActiveRecord::Migration
  def change
  	drop_table :category_products
  	drop_table :product_categories
  end
end
