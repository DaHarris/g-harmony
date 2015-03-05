class PostsController < ApplicationController

  before_action :logged_in?

  def index
    @posts = Post.all
    @posts = @posts.order('timestamp_field DESC')
    if params[:most_likes]
      @posts = @posts.sort_by{|post| post.likes.length }.reverse
    end
    if params[:most_recent]
      @posts = @posts.order('timestamp_field DESC')
    end

  end

  def show
    @post = Post.find_by_id(params[:id])
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save && params[:tag_titles] != nil
      params[:tag_titles].each do |tag|
         Assignment.create(post_id: @post.id, tag_id: Tag.find(tag).id)
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
    if @post.update(post_params) && params[:tag_titles] != nil
      params[:tag_titles].each do |tag|
        if !@post.tags.find_by_title(Tag.find(tag).title)
          Assignment.create(post_id: @post.id, tag_id: Tag.find(tag).id)
        end
      end
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
    @like = Like.create(post_id: @post.id, user_id: current_user.id)
    redirect_to root_path, notice: "Liked!"
  end

  helper_method :user_liked

  def user_liked(post)
    if current_user
      post.likes.each do |like|
        if like.user_id == current_user.id
          return false
        end
      end
    end
    return true
  end

  private

  def post_params
    params.require(:post).permit(:code, :url, :description, :title)
  end

end
