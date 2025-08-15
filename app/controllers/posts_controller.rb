class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
    #@post = current_user
  end

  def show
    @post = Post.find(params[:id])
    @review = Review.new
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
    post = Post.find(params[:id])
    unless post.user_id == current_user.id
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    post = Post.find(params[:id])
    unless post.id == current_user.id
      redirect_to posts_path
    end

    if @post.update(post_params)
      flash[:notice] = "更新が完了しました。"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :address, :telephone_number, :opening_times, :closed_day, :post_image, tag_ids: [])
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end

end
