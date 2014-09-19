class Product < ActiveRecord::Base

 
	has_many :product_categories
	has_many :categories, through: :product_categories, :source => 'category'
	has_many :inquiries

	 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	 

end
