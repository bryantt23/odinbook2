class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validate :cant_friend_self
  validates :friend_id, uniqueness: { scope: :user_id }

  private
  def cant_friend_self
    if user_id == friend_id
      errors.add(:friend_id, "cannot friend yourself")
    end
  end
end
