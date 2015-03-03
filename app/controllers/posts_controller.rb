class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save && params[:tag_titles] != nil
      array = params[:tag_titles]
      array.each do |tag|
        ass = Assignment.new
        ass.post_id = @post.id
        ass.tag_id = Tag.find(tag).id
        ass.save
      end
      redirect_to root_path, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post was successfully destroyed."
  end

  def like
    @post = Post.find(params[:post_id])
    @like = Like.new()
    @like.post_id = @post.id
    @like.save
    redirect_to root_path, notice: "Liked!"
  end

  private

  def post_params
    params.require(:post).permit(:code, :url, :description, :title)
  end

end
