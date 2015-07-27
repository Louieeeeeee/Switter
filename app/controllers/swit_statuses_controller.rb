class SwitStatusesController < ApplicationController
  before_action :set_swit_status, only: [:show, :edit, :update, :destroy]

  # GET /swit_statuses
  # GET /swit_statuses.json
  def index
    @swit_statuses = SwitStatus.all
  end

  # GET /swit_statuses/1
  # GET /swit_statuses/1.json
  def show
  end

  # GET /swit_statuses/new
  def new
    @swit_status = SwitStatus.new
  end

  # GET /swit_statuses/1/edit
  def edit
  end

  def sweet
    @currentUser = User.find(session[:user_id])
    @currentSwit = Swit.find(swit_status_params[:swit_id])
    status = @currentSwit.swit_statuses.find_or_create_by(:user_id=>@currentUser.id)
    status.update_attributes(:status => 0)
    redirect_to(:controller=>"swits", :action=>"index")
  end

  def sour
    @currentUser = User.find(session[:user_id])
    @currentSwit = Swit.find(swit_status_params[:swit_id])
    status = @currentSwit.swit_statuses.find_or_create_by(:user_id=>@currentUser.id)
    status.update_attributes(:status => 1)
    redirect_to(:controller=>"swits", :action=>"index")
  end

  # POST /swit_statuses
  # POST /swit_statuses.json
  def create
    @swit_status = SwitStatus.new(swit_status_params)

    # respond_to do |format|
      if @swit_status.save
        # format.html { redirect_to @swit_status, notice: 'Swit status was successfully created.' }
        # format.json { render :show, status: :created, location: @swit_status }
        redirect_to(:controller=>"swits", :action=>"index")
      else
      #   format.html { render :new }
      #   format.json { render json: @swit_status.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /swit_statuses/1
  # PATCH/PUT /swit_statuses/1.json
  def update
    respond_to do |format|
      if @swit_status.update(swit_status_params)
        format.html { redirect_to @swit_status, notice: 'Swit status was successfully updated.' }
        format.json { render :show, status: :ok, location: @swit_status }
      else
        format.html { render :edit }
        format.json { render json: @swit_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swit_statuses/1
  # DELETE /swit_statuses/1.json
  def destroy
    @swit_status.destroy
    respond_to do |format|
      format.html { redirect_to swit_statuses_url, notice: 'Swit status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit_status
      @swit_status = SwitStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_status_params
      params.require(:swit_status).permit(:user_id, :swit_id, :status)
    end
end
