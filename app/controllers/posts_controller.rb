class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts=Post.all
  end

  def create
    @post=current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post=Post.new
  end

  def destroy
    @post=Post.find(params[:id])
    if current_user.id!=@post.user_id
      render :show, status: :unauthorized
      return
    end

    if @post.destroy
      redirect_to posts_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:subject, :content)
  end
end
