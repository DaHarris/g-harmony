class TagsController < ApplicationController

  def new
  end

  def create
    @tag = Tag.new(title: params[:title])
    if @tag.save
      redirect_to new_post_path
    else
      redirect_to new_post_path
    end
  end
end
