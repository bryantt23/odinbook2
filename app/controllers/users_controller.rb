class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @friend_ids=@user.friendships.pluck(:friend_id)
    @non_friend_ids=User.where.not(id: @friend_ids).where.not(id: @user.id).pluck(:id)
    @non_friends=User.where(id: @non_friend_ids)

    @posts=Post.where(user_id: @user.id).order(created_at: :desc)
  end

  def index
    @users=User.all
  end
end
