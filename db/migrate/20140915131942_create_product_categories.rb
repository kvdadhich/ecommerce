class CreateProductCategories < ActiveRecord::Migration
  def change
  	  create_table :product_categories do |t|
	      t.belongs_to :category
	      t.belongs_to :product
     	  t.timestamps
      end
   
  end
end
