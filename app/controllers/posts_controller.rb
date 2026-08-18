class PostsController < ApplicationController
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

  def post_params
    params.require(:post).permit(:subject, :content)
  end
end
