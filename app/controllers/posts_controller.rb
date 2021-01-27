class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @users = User.all
    @author = User.find(@post.user_id)
  end

  def new
    @post = Post.new
    @users = User.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @users = User.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.where(post_id: params[:id])
    @comment.length.times do |i|
      @comment[i].destroy
    end
    @post.destroy

    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :user_id)
    end
end
