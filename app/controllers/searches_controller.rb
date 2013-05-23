class SearchesController < ApplicationController
  def create
	@query = params[:search][:query]
  	@posts = Post.search(@query)
  	@users = User.search(@query)
  end
end
