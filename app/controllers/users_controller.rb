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

  def edit
    @user = User.find(params[:id])
    if Profile.exists?(:user_id => params[:id])
      @profile = Profile.where(:user_id => params[:id]).last
    else
      @profile = Profile.new
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(profile_params)
      flash[:notice] = "Profile updated"
      redirect_to @user
    else
      flash[:alert] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def is_friend
    target_user = User.find(params[:id])
    return if target_user.friends.exists?(:friend_id => current_user.id) || target_user == current_user
    flash[:alert] = "You must be friends with a user to view their profile"
    redirect_to :root
  end

  def profile_params
    params.require(:user).permit(profile_attributes: [:id, :birthday, :location, :hometown, :relationship_status, :bio])
  end
  
end