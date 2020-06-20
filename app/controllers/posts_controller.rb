class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    #only show posts by current user and their friends
    author_ids = [current_user.id]
    current_user.friends.each do |friend|
      author_ids << friend.friend_id
    end
    @posts = Post.where(author_id: author_ids).order(created_at: :desc).page(params[:page])

    @new_post = Post.new
    @new_comment = Comment.new

    #suggest friends of friends that the user is not alreay friends with
    friends_of_friends = Array.new
    current_user.friends.each do |f|
      friend = User.find(f.friend_id)
      friend.friends.each do |fof|
        next if current_user.friends.exists?(:friend_id => fof.friend_id) || FriendRequest.exists?(:user_id => current_user.id, :requesting_user_id => fof.friend_id) || fof.friend_id == current_user.id
        friends_of_friends << fof.friend_id
      end
    end
    @suggested_friends = User.where(id: friends_of_friends).sample(5)
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.save ? flash[:notice] = "Post successfully created" : flash[:alert] = "Something went wrong"
    redirect_to posts_path
  end

  def like
    new_like = Like.new(:user_id => current_user.id, :post_id => params[:post_id])
    flash[:alert] = "Something went wrong" if !new_like.save
    redirect_back(fallback_location: root_path)
  end

  def new_comment
    new_comment = Comment.new(:author_id => current_user.id, :post_id => params[:post_id], :content => params[:content])
    flash[:alert] = "Something went wrong" if !new_comment.save
    redirect_back(fallback_location: root_path)
  end
  
  private

  def post_params
    params.require(:post).permit(:content)
  end

end