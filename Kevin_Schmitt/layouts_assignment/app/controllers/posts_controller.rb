class PostsController < ApplicationController
  def index_posts
  end
  def index
    @posts = Book.all.order! 'created_at DESC'
    render 'posts/index_posts'
  end
  def create
    post = Book.new(post_params)
    if post.valid?
      post.save
      return redirect_to :back #goes back to previous page
    end
    # return redirect_to :back
  end
  private
  def post_params
    params.require(:post).permit(:title, :comment, :author)
  end
end
