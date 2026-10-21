require "test_helper"

class FriendshipTest < ActiveSupport::TestCase
  test "user cannot follow themselves" do
    user = User.create
    friendship = user.friendships.build(friend_id: user.id)
    friendship.save
    assert_not friendship.valid?
    assert_includes friendship.errors[:friend_id], "cannot friend yourself"
  end
end
