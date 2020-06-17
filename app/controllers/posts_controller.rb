class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    #TODO limit to only posts by user and their friends
    @posts = Post.all
    @new_post = Post.new
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.save ? flash[:notice] = "Post successfully created" : flash[:alert] = "Something went wrong"
    redirect_to posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:content)
  end
end
