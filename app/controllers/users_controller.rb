class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    # respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        session[:username] = @user.username
        redirect_to(:controller=>"swits", :action=>"index")
      else
        # format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
        flash[:notice] = "Oops"
        redirect_to(:action=>"index")
      end
    # end
  end

  def login
    @user = User.where(:username => params[:username]).first
    if @user
      status = @user.authenticate(params[:password])
    end

    if status
      session[:user_id] = @user.id
      session[:username] = @user.username
      flash[:notice] = "Success"
      redirect_to(:controller=>"swits", :action=>"index")
    else
      flash[:notice] = "Invalid username/password"
      redirect_to(:action=>"index")
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to(:action=>"index")
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # respond_to do |format|
      if @user.update(user_params)
      flash[:notice] = "Password updated successfully"
      redirect_to(:action=>"edit")
      #   format.html { redirect_to @user, notice: 'User was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @user }
      else
      flash[:notice] = "Password doesn't match"
      redirect_to(:action=>"edit")
      #   format.html { render :edit }
      #   format.json { render json: @user.errors, status: :unprocessable_entity }
      # end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
