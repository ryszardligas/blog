class CommentsController < ApplicationController

  #http_basic_authenticate_with :name => "rysiek", :password => "secret", :only => :destroy

   before_filter :login_required

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
