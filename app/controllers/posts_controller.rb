class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments, :likes).order(created_at: :asc)
  end

  def show
    @post = Post.includes(:author, :comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params['title']
    @post.text = params['text']
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
