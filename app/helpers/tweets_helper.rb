module TweetsHelper
  def can_manage_post?(tweet)
    tweet.user_id == current_user.id
  end
end
