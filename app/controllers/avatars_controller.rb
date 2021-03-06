class AvatarsController < ApplicationController

  before_filter :load_parent
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]

  # GET /avatars
  # GET /avatars.json
  def index
    @avatars = Avatar.all
  end

  # GET /avatars/1
  # GET /avatars/1.json
  def show
  	logger.info "### Selecting AVATARS in AvatarsController#show"
  	@avatar = @user.avatar.find(params[:id])
  end

  # GET /avatars/new
  def new

    @avatar = @user.avatar.new

  end

  # GET /avatars/1/edit
  def edit
  	logger.info "### Selecting AVATARS in AvatarsController#edit"
  	@avatar = @user.avatar.find(params[:id])

  end

  # POST /avatars
  # POST /avatars.json
  def create
    @avatar = @user.avatar.new(avatar_params)

    respond_to do |format|
      if @avatar.save
        format.html { redirect_to new_user_avatar_path(current_user), notice: 'Avatar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @avatar }
      else
        format.html { render action: 'new' }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avatars/1
  # PATCH/PUT /avatars/1.json
  def update
  	logger.info "### Begin Update AvatarsController#update"
  	@avatar = @user.avatar.find(params[:id])

    respond_to do |format|
      logger.info "### Updating AVATARS in AvatarsController#update"
      if @avatar.update(avatar_params)
        format.html { redirect_to edit_user_avatar_path(@user, @avatar), notice: 'Avatar was successfully updated.' }
        format.json { head :no_content }
      else
      	logger.info "### Failed to update AVATARS in AvatarsController#update"
        format.html { render action: 'edit' }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatars/1
  # DELETE /avatars/1.json
  def destroy
    @avatar.destroy
    respond_to do |format|
      format.html { redirect_to avatars_url }
      format.json { head :no_content }
    end
  end

  private

  	def load_parent
  		logger.info "### Loading USERS in load_parent method AvatarsController"

      	@user = User.find(params[:user_id])   
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
    	logger.info "### Selecting USERS in set_avatar method AvatarsController"
      	@user = User.find(params[:user_id]) 

      	logger.info "### Loading AVATARS in load_parent method AvatarsController"  
      	@avatar = @user.avatar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_params
      params.require(:avatar).permit(:avatar, :user_id)
    end
end
