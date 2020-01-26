class CommentsController < ApplicationController
   before_action :authenticate_user!, only: :create

  def index
    render json: Comment.order(:id).reverse_order
  end

  def create
      comment = Comment.create(comment_params.merge(user: current_user))
      render json: comment
  end

  private
    def comment_params
      params.require(:comment).permit(:message, :rating, :brewery_db_id, :location)
    end
end
