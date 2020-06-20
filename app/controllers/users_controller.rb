class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_friend, only: [:show]

  def index
    non_friends = Array.new
    User.all.each do |user|
      next if current_user.friends.exists?(:friend_id => user.id) || user.id == current_user.id
      non_friends << user.id
    end
    @users = User.where(id: non_friends)
  end
  
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.order(created_at: :desc)
  end

  private

  def is_friend
    target_user = User.find(params[:id])
    return if target_user.friends.exists?(:friend_id => current_user.id) || target_user == current_user
    flash[:alert] = "You must be friends with a user to view their profile"
    redirect_to :root
  end
  
end