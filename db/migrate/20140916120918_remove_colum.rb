class RemoveColum < ActiveRecord::Migration
  def self.up
  remove_column :products, :f_product
	end
end
