class ReviewsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @review = current_user.reviews.new(review_params)
    @review.post_id = post.id

    if @review.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to request.referer
    else
      flash[:alert] = "保存に失敗しました。"
      redirect_to request.referer
    end
  end

  def destroy
    Review.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  private

  def review_params
    params.require(:review).permit(:review, :comment)
  end

end
