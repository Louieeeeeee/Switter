class SwitCommentsController < ApplicationController
  before_action :set_swit_comment, only: [:show, :edit, :update, :destroy]

  # GET /swit_comments
  # GET /swit_comments.json
  def index
    @swit_comments = SwitComment.all
  end

  # GET /swit_comments/1
  # GET /swit_comments/1.json
  def show
  end

  # GET /swit_comments/new
  def new
    @swit_comment = SwitComment.new
  end

  # GET /swit_comments/1/edit
  def edit
  end

  # POST /swit_comments
  # POST /swit_comments.json
  def create
    @swit_comment = SwitComment.new(swit_comment_params)

    # respond_to do |format|
      if @swit_comment.save
        # format.html { redirect_to @swit_comment, notice: 'Swit comment was successfully created.' }
        # format.json { render :show, status: :created, location: @swit_comment }
        redirect_to(:controller=>"swits", :action=>"index")
      else
      #   format.html { render :new }
      #   format.json { render json: @swit_comment.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /swit_comments/1
  # PATCH/PUT /swit_comments/1.json
  def update
    respond_to do |format|
      if @swit_comment.update(swit_comment_params)
        format.html { redirect_to @swit_comment, notice: 'Swit comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @swit_comment }
      else
        format.html { render :edit }
        format.json { render json: @swit_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swit_comments/1
  # DELETE /swit_comments/1.json
  def destroy
    @swit_comment.destroy
    respond_to do |format|
      format.html { redirect_to swit_comments_url, notice: 'Swit comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit_comment
      @swit_comment = SwitComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_comment_params
      params.require(:swit_comment).permit(:swit_id, :user_id, :comment)
    end
end
