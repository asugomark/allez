class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, only: [:edit, :update, :settings]

  before_action :build_avatar, only: [:show, :edit, :update, :destroy]

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Redirect to user profile page after successful sign in
  def after_sign_in_path_for(resource)
  	user_path(current_user)
  end

  private

  # Redirect to sifn in page after successful sign out
  def after_sign_out_path_for(resource_or_scope)
  	new_user_session_path
  end

  def build_avatar

  	if !@user.nil?

  		puts "### CONTROLLER: #{params[:controller]}"
  		puts "### ACTION: #{params[:action]}"

  		if params[:action] == "update" && params[:controller] == "devise/registrations"
  			puts "### We on the IF condition"

  			@user = User.find(session["warden.user.user.key"][0])
  			@avatar = Avatar.find_by(user_id: @user)
	
  		else
  			puts "### We are now running the ELSE condition"

  			@user = User.find(params[:id])   
      		@avatar = @user.avatar.find(params[:id])
  			
  		end

  	end
  	
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| 
    	u.permit(:name, :account_type_id, :email, :password, :password_confirmation, :county_id, :agree, :slug) 
    }

    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:name, :account_type_id, :email, :password, :password_confirmation, :county_id, :agree, :slug, :current_password)
  	}
  end
end
