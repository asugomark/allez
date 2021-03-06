class UsersController < ApplicationController
  def show
  	
  	begin
  		@user = User.find(params[:id])
  		@avatar = @user.avatar.find(params[:id])
  		@avatar_count = @user.avatar.count
  	rescue ActiveRecord::RecordNotFound
  		logger.info "### Avatars count: #{@user.avatar.count}"
  		@avatar_count = @user.avatar.count
  		flash[:notice] = 'The object you tried to access does not exist'
  		#return   # or e.g. redirect_to :action => :index
	end

  end
end
