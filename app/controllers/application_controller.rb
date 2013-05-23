class ApplicationController < ActionController::Base
  	protect_from_forgery

	helper_method :current_user

  	def current_user
  		if session[:user_id].present?
  			@current_user = User.find(session[:user_id])
  		else
  			@current_user = nil
  		end
  	end

  	def require_user
  		if current_user.nil?
  			flash[:error] = "You need to be logged in"
			redirect_to new_session_path 
  		end
  	end


end
