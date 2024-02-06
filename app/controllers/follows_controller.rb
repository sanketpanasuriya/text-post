class FollowsController < ApplicationController
  before_action :set_user, only: %i[ create destroy ]
 
  def create
    current_user.follow(@user)
  end

  def destroy
    current_user.unfollow(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
