class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :mypage]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.page(params[:page])
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end

    if @user.update(user_params)
      flash[:notice] = "更新が完了しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def mypage
    @user = current_user
    @posts = @user.posts.page(params[:page])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_user_registration_path
  end

  def guest_login
    @user = User.guest
    sign_in(@user)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
end
