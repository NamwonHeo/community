class ManagerpostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_managerpost, only: [:show, :edit, :update, :destroy]

  # GET /managerposts
  # GET /managerposts.json
  def index
    if current_user.has_role?(:admin)
      @managerpost = Managerpost.all
    else
      @managerposts = Managerpost.published_managerposts
    end
  end

  # GET /managerposts/1
  # GET /managerposts/1.json
  def show
  end

  # GET /managerposts/new
  def new
    @managerpost = Managerpost.new
  end

  # GET /managerposts/1/edit
  def edit
  end

  # POST /managerposts
  # POST /managerposts.json
  def create
    @managerpost = Managerpost.new(managerpost_params)
    @managerpost.user = current_user

    respond_to do |format|
      if @managerpost.save
        format.html { redirect_to @managerpost, notice: 'Managerpost was successfully created.' }
        format.json { render :show, status: :created, location: @managerpost }
      else
        format.html { render :new }
        format.json { render json: @managerpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managerposts/1
  # PATCH/PUT /managerposts/1.json
  def update
    respond_to do |format|
      if @managerpost.update(managerpost_params)
        format.html { redirect_to @managerpost, notice: 'Managerpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @managerpost }
      else
        format.html { render :edit }
        format.json { render json: @managerpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managerposts/1
  # DELETE /managerposts/1.json
  def destroy
    @managerpost.destroy
    respond_to do |format|
      format.html { redirect_to managerposts_url, notice: 'Managerpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_managerpost
      @managerpost = Managerpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def managerpost_params
      params.require(:managerpost).permit(:user_id, :title, :content, :published)
    end
end
