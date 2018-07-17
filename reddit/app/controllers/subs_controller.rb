class SubsController < ApplicationController
  before_action :ensure_valid_subreddit, except: [:new, :create, :index]
  
  def new; end
  
  def show; end
  
  def index; end
  
  def create
    new_sub = Sub.new(sub_params)
    if new_sub.save
      redirect_to sub_url(new_sub)
    else
      render :new
    end
  end
  
  def edit
    if @subreddit.moderator?
      render :edit
    else
      redirect_to subs_url
    end
  end
  
  def update
    if @subreddit.moderater? && @subreddit.update(sub_params)
      redirect_to sub_url(@subreddit)
    else
      render :edit
    end
  end
  
  def ensure_valid_subreddit
    @subreddit = Sub.find_by(id: params[:id])
    redirect_to subs_url unless @subreddit
  end
  
end
