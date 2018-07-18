class CommentsController < ApplicationController
  before_action :ensure_valid_comment, except: [:create, :new]
  
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post_id)
    end
  end

  def edit; end
  
  def update
    if @commnet.update(comment_params)
      redirect_to post_url(@comment.post_id)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_url(@comment.post_id)
  end

  def show; end
  
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
  
  def ensure_valid_comment
    @comment = Comment.find_by(id: params[:id])
    redirect_to subs_url unless @comment
  end
end
