class SessionsController < ApplicationController
  def new

  end
  
  def create
  	# try and find a user with that username
  	@user = User.find_by_username(params[:login][:username])

  	# try and login by email

  	if @user.nil?
  		@user = User.find_by_email(params[:login][:username])
  	end

  	#make sure the password of that user is correct
  	@user = @user.try(:authenticate, params[:login][:password])

  	# if user and password is correct
  	if @user

  		# set the session to that user
  		session[:user_id] = @user.id

  		flash[:alert] = "yay you logged in"

  		redirect_to root_path

  	else
  		#show the form again
  		render "new"
  	end

  
  end
  
  def destroy
  	#delete all browser session data
    reset_session

    flash[:alert] = "Yay, logged out!"

	redirect_to root_path
  end
end
