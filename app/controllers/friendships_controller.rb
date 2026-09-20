class FriendshipController < ApplicationController
  before_action :authenticate_user!

  def create
    binding.break
    @friendship=current_user.friendships.build(params[:friend_id])

    if @like.save
      redirect_to @user, notice: "Added friend"
    else
      redirect_to @user, alert: "Could not add friend"
    end
  end
end
