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

  	logger.info "### Is User object present: #{@user.present?}"
    if @user.present? 

      	logger.info "### If true, check for Avatars with current_user ID"
      	if Avatar.where(:user_id => current_user.id).blank?

        	logger.info "### No Avatar was found for the current_user"
      	else

        	logger.info "### An Avatar was found for this user, Load it"
        	@avatar = Avatar.find_by(user_id: current_user.id)
      	end

    logger.info "### Check for session: #{session.present?}"
    elsif session.present? && @user.blank?

      	logger.info "### If true, fetch user from session"
      	@user = User.find(session["warden.user.user.key"][0])

      	logger.info "### Checkif we have an Avatar for this user"
      	if Avatar.where(:user_id => @user).blank?
      
        	logger.info "### We do not have an avatar for this User"

      	else

        	logger.info "### An Avatar was found for this User"
        	@avatar = Avatar.find_by(user_id: @user)
      	end
    
    else

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
