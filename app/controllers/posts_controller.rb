class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    p @post
  end

  private
  # you have to define or explicitly say what parameters you want to allow
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
