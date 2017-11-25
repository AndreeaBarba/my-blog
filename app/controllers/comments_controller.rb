class CommentsController < ApplicationController

 def create
    authenticate!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.commentor = current_user
    if @comment.save
      flash[:notice] = "You have successfully created a new comment!"
      redirect_to post_path(@post)
    # else
    #   @errors = @comment.errors.full_messages
    #   render 'form'
    end
  end


  def edit
    authenticate!
    find_comment
  end

  def update
    authenticate!
    find_comment
    authorize!(@comment.commentor)
    if @comment.update(comment_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    authenticate!
    find_comment
    authorize!(@comment.commentor)
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
end


