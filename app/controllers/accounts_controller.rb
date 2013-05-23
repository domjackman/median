class AccountsController < ApplicationController

	# make sure we're signed in

	before_filter :require_user


  def edit
  	@user = current_user
  end

  def update
  	@user = current_user

  	if @user.update_attributes(params[:user])
		flash[:alert] = "You've update your profile"
	end

	render "edit"
  end


end
