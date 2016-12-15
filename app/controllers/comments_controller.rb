class CommentsController < ApplicationController
	def create
		product = Product.find(params[:id])
		c = Comment.new(product: product, comment: params[:comment])
		if(c.save)
			redirect_to :back
		else
			flash[:errrors] = c.errors.full_messages
		end
	end
end
