class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post: @post)

    if @like.save
      redirect_to @like.post, notice: 'Post liked'
    else
      redirect_to @like.post, alert: 'Unable to like post'
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to @like.post, notice: 'Post unliked'
  end

  # def like_params
  #     params.require(:like).permit(:post_id)
  # end

end
