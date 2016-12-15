class ProductsController < ApplicationController
	def index
		@products = Product.joins(:category).select('products.name', :pricing, :description, 'categories.name as cat_name', 'products.id')
	end
	def show
		@product = Product.joins(:category).select('products.name', :pricing, :description, 'categories.name as cat_name', 'products.id').find(params[:id])
		@comments = Comment.where(product:@product)
	end
	def new
		@categories = Category.all
	end
	def create
		category = Category.find(params[:category_id])
		p = Product.new(name: params[:name], category: category, description: params[:description], pricing: params[:pricing])
		if(p.save)
			redirect_to products_path
		else
			flash[:errrors] = p.errors.full_messages
		end
	end

end
