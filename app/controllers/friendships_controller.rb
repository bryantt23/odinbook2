class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user=User.find(current_user.id)
    @friendship=current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      redirect_to @user, notice: "Added friend"
    else
      redirect_to @user, alert: "Could not add friend"
    end
  end
end
