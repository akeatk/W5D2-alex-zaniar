class PostsController < ApplicationController
  before_action :ensure_valid_post, except: [:new, :create]
  
  def new; end
  
  def show; end
  
  def create
    post = Post.new(post_params)
    post.author_id = current_user.id
    if post.save
      redirect_to post_url(post)
    else
      render :new
    end
  end
  
  def edit
    if @post.author?
      render :edit
    else
      redirect_to subs_url
    end
  end
  
  def update
    if @post.author? && @post.update(post_params)
      redirect_to sub_url(@post)
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to to subs_url(@post.sub_id)
  end
  
  
  def ensure_valid_post
    @post = Post.find_by(id: params[:id])
    redirect_to subs_url unless @post
  end
  

  def post_params
    params.require(:post).permit(:title, :sub_id, :content, :url)
  end
end
