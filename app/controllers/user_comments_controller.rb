class UserCommentsController < ApplicationController

	before_filter :require_user

	def create
		@post = Post.find_by_url(params[:post_id])

		@comment = @post.comments.new(params[:comment])
		@comment.user = current_user

		if @comment.save
			flash[:alert] = "Thanks for your comment"
		else
			flash[:error] = "Please add a message to your comment"
		end

		redirect_to post_path(@post)
	end
end
