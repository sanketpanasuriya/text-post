class User < ApplicationRecord
  has_many :tweets
  has_many :followings, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :followed_users, through: :followings, source: :followed
  has_many :inverse_followings, foreign_key: :followed_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :inverse_followings, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_users.include?(user)
  end
end
