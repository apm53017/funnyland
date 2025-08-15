class Admin::TagsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "タグを登録しました。"
      redirect_to admin_tags_path
    else
      render :new
    end
  end

  private
  
  def tag_params
    params.require(:tag).permit(:tag_name, :icon)
  end
  
end
