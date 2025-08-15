class SearchesController < ApplicationController
  #before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @tag_id = params[:tag_id]

    if @tag_id.present? && !@model.present?
      @tag = Tag.find(@tag_id)
      @records = Post.includes(:tags).where('tags.id': @tag_id)
    elsif @model == 'user'
      @records = User.search_for(@content, @method)
    else
      @records = Post.search_for(@content, @method)
    end
  end

end
