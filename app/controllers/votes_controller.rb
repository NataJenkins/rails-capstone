class VotesController < ApplicationController
  def create
    @votes = current_user.votes.new(article_id: params[:article_id])
    if @votes.save
      flash[:success] = 'voted'
    else
      render 'new'
    end
    redirect_to article_path(params[:article_id])
  end

  def destroy
    @vote = Vote.find_by(article_id: params[:article_id], user_id: current_user.id)
    flash[:success] = 'Unvoted' if @vote.destroy
  end

  def new; end
end
