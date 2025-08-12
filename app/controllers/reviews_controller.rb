class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @review = current_user.reviews.new(review_params)
    @review.post = @post

    if @review.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to @post
    else
      flash[:alert] = "保存に失敗しました。"
      render 'posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @review.destroy
    flash[:notice] = "削除しました"
    redirect_to @post
  end

  private

  def review_params
    params.require(:review).permit(:review, :comment)
  end

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    redirect_to root_url unless @review
  end
end
