class PostsController < ApplicationController
  def index
    @post = Post.new
    page = (params[:page] || 1).to_i
    session[:offset] ||= "0"
    session[:offset] = "0" if page == 1
    @posts = Post.paginate(page: params[:page], per_page: 20)
                 .offset((page - 1) * 20 + session[:offset].to_i)
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
          format.js do
            session[:offset] ||= "0"
            session[:offset] = (session[:offset].to_i + 1).to_s
          end
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
