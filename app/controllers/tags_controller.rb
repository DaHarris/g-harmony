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

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end
