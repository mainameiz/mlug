class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  
  def index
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.author = current_user if current_user
    if @post.save
      redirect_to @post, :notice => "created"
    else
      render :new, :notice => "SOmething went wrong"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def destroy
  end
end
