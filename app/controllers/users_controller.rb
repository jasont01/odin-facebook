class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_friend, only: [:show]

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  private

  def is_friend
    target_user = User.find(params[:id])
    return if target_user.friends.exists?(current_user.id) || target_user == current_user
    flash[:alert] = "You must be friends with a user to view their profile"
    redirect_to :root
  end
  
end

#TODO Make friend requests bi-directional
#TODO 16. Set up a mailer to send a welcome email when a new user signs up. Use the letter_opener gem (see docs here) to test it in development mode.