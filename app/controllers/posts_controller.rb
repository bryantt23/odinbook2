class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

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

  def edit
    if current_user.id!=@post.user_id
      render :show, status: :unauthorized
    end
  end

  def new
    @post=Post.new
  end

  def update
    if current_user.id!=@post.user_id
      render :show, status: :unauthorized
      return
    end
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
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
  end

  private

  def post_params
    params.require(:post).permit(:subject, :content)
  end

  def set_post
    @post=Post.find(params[:id])
  end
end
