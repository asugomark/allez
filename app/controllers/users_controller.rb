class UsersController < ApplicationController
  def show
  	
  	begin
  		@user = User.find(params[:id])
  		@avatar = @user.avatar.find(params[:id])
  	rescue ActiveRecord::RecordNotFound
  		flash[:notice] = 'The object you tried to access does not exist'
  		redirect_to new_user_avatar_path
  		return   # or e.g. redirect_to :action => :index
	end

  end
end
