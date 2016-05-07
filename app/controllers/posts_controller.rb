class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all
    if @post.save
      flash[:succes] = "Post created!"
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
