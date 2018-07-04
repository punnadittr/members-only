class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    user = @current_user
    @post = Post.new(author: user.name, content: params[:post][:content], user_id: user.id)
    @post.save
    redirect_to root_path
  end
end
