class VotesController < ApplicationController
  def create
    @choice = Choice.find(params[:choice_id].to_i)
    @question = Question.find(params[:question_id].to_i)
    @vote = Vote.new(choice_id: @choice.id)
    @vote.user = current_user
    if @vote.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Nice Vote.' }
        format.js
      end
    end
  end

  private

  def vote_params
    params.require(:choice_id)
  end
end
