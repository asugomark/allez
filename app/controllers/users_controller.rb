class UsersController < ApplicationController
  def show

  	@user = User.find(params[:id])
  	@avatar = @user.avatar.find(params[:id])

  end
end
