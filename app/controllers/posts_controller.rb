class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all
    respond_to do |format|
      if @post.save
          format.html { redirect_to root_path }
          format.js
      else
          format.html { render :index }
          format.js
      end
    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
