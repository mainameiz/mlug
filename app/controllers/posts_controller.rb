class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  load_and_authorize_resource
  
  def new
  end
  
  def replay
    @comment = @post.comments.build(params[:comment])
    @comment.author = current_user
    if params[:preview]
      render :show
    elsif @comment.save
      redirect_to post_url(@post.id, :anchor => "comment_#{@comment.id}")
    else
      render :show
    end
  end

  def create
    @post.author = current_user
    if params[:preview]
      render :new
    elsif @post.save
      redirect_to @post, :notice => "created"
    else
      render :new, :notice => "Something went wrong"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    #flash[:notice] = I18n.t('')
    redirect_to root_url
  end
end
