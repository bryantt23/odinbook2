class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @non_friend_ids= Friendship.where(user_id: current_user.id).pluck(:friend_id)
    @non_friend_ids.push(current_user.id)
    # @non_friends=User.where.not(Friendship.where(user_id: current_user.id))
    @non_friends=User.where.not(id: @non_friend_ids)
    binding.break
  end

  def index
    @users=User.all
  end
end
