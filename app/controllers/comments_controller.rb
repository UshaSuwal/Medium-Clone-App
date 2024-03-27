class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save && @comment.valid?
      redirect_to @post
    else
      flash[:alert] = "Invalid params"
      redirect_to @post
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.valid?
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  private
  def comment_params
    params.require(:comment).permit(:description, :user_id, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end




    def is_owner?
      # redirect_to root_path if Comment.find(params[:id]).user != current_user
      unless @comment.user == current_user || @post.user == current_user
        redirect_to root_path
        return
      end
    end
end
