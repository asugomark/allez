class UsersController < ApplicationController
  def show

  	@user = User.find(params[:id])
  	@avatar = @user.avatar.find(params[:id])

  	if @avatar.nil?
  		rescue_from ActiveRecord::RecordNotFound do
  			flash[:notice] = 'The object you tried to access does not exist'
  			redirect_to user_path   # or e.g. redirect_to :action => :index
		end
  	end

  end
end
