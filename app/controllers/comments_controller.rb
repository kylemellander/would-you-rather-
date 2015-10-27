class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  def index
    @comment = Comment.new
    @question = Question.find(params[:question_id])
    @comments = @question.comments
  end

  # GET /comments/1
  def show
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @question = Question.find(params[:question_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html {redirect_to @comment, notice: 'Comment was successfully created.'}
      format.js
    end
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
