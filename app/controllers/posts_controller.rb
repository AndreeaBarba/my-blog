class PostsController < ApplicationController
  before_action :authenticate!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action -> { authorize!(@post.author)}, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "You have successfully created a new post!"
      current_user.posts << @post
      redirect_to @post
    else
      @errors = @post.errors.full_messages
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      @errors = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  # you have to define or explicitly say what parameters you want to allow
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end

end
