class PublicController < ApplicationController
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
			format.rss
      format.json { render json: @posts }
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