class PublicController < ApplicationController
  layout "public"
  def index
    @posts = Post.all(:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  # This action is just for the public RSS feed.
  def feed
    @posts = Post.all(:order => "created_at DESC")
    respond_to do |format|
      format.rss
    end
  end
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  def create_comment
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to :action => 'index' }
      else
        format.html { redirect_to :action => 'index' }
      end
    end
  end
end