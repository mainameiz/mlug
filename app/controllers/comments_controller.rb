class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :show ]
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, :through => :post
  helper_method :comments_for
  helper_method :wrap_comments

  def show
    @new_comment = @post.comments.build
  end

  def preview
  end

  def replay
    @new_comment = @post.comments.build(params[:comment])
    @new_comment.author = current_user
    @new_comment.parent = @comment
    if params[:preview]
      render :show
    elsif @new_comment.save
      redirect_to post_url(@post.id)
    else
      render :show, :alert => 'failed to replay'
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(params[:comment])
#      flash[:notice] = I18n.t('')
      redirect_to post_url(@comment.post_id)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
#    notice[:flash] = I18n.t('')
    redirect_to post_url(@comment.post_id)
  end
end
