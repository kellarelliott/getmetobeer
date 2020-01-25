class CommentsController < ApplicationController

  def index
    render json: Comment.order(:created_at)
  end

  def create
    comment = Comment.create(comment_params.merge(user: current_user))
    render json: comment
  end

  private
    def comment_params
      params.require(:comment).permit(:message, :rating)
    end
end
