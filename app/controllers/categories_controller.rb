class CategoriesController < ApplicationController
  def index
  	@categories = Category.order(:title)
  end

  def show
  	@category = Category.find(params[:id])
  end
end
