class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  def index
    @question = Question.find(params[:question_id])
    @comments = Comment.all
    @comment = Comment.new
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @question = Question.find(params[:question_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html {redirect_to @comment, notice: 'Comment was successfully created.'}
        format.js
      end
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params[:comment][:question_id] = params[:question_id]
      params.require(:comment).permit(:content, :question_id)
    end
end
