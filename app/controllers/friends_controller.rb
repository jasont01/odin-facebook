class FriendsController < ApplicationController

  def new_request
    request = FriendRequest.new(:user_id => params[:user_id], :requesting_user_id => current_user.id)
    request.save ? flash[:notice] = "Friend Request Sent!" : flash[:alert] = "Something went wrong"
    redirect_to :root
  end

  def accept_request
    new_friend = current_user.friends.build(:friend_id => params[:requesting_user_id])
    if new_friend.save
      flash[:notice] = "Friend Added!"
      FriendRequest.find(params[:request_id]).destroy
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to :root
  end
  
end