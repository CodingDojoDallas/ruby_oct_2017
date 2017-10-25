class PostsController < ApplicationController
  def index
    @posts = Post.all
  end


  def show
    @posts = Post.find(params[:id])
   end
   
   
  def new
    @posts = Post.new
  end
  
  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post_path(posts)
    else
      redirect_to new_post_path
    end    
  end   

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end  

end
