class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: %i[update destroy]

  def index
    @comments = Comment.all
  end

  def create
    return unless comment_param[:content].present?

    current_user.comments.create!(comment_param)
    redirect_to comments_path
  end

  def update
    @comment.update!(comment_param)
    redirect_to comments_path
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_param
    params.require(:comment).permit(:content)
  end
end
