class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post=Post.find(params[:post_id])
    @like=@post.likes.new(user: current_user)

    if @like.save
      redirect_to @post, notice: "Like added successfully!"
    else
      redirect_to @post, alert: "Could not like post."
    end
  end
end
