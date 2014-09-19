class AddFProductToProduct < ActiveRecord::Migration
  def change
    add_column :products, :f_product, :string
  end
end
