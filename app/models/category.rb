class Category < ActiveRecord::Base


	has_many :product_categories
	has_many :products, through: :product_categories, :source => 'product'
	

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	def self.sel_options
	    options = Array.new
	    category = self.order("LOWER(name)")
	   		category.each do |u|
	  			option = Array.new
	  			option.push(u.name)
	  			option.push(u.id)
	   			options.push(option) 
	  		end
	    return options
	end
end
