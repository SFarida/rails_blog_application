class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.text = params['text']
    @comment.author = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      render :new, status: :unprocessable_entity
    end
  end
end
