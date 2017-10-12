class UserController < ApplicationController
  def index
    render json: User.all
  end

  def new
  end

  def show
    if params[:id] == "total"
      p User.all
      total = User.all.length
      p total
      render :text => "There are currently #{total} users."
    else
      render json: User.find(params[:id])
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    User.create(first_name:params[:first_name],last_name:params[:last_name])
    puts "Added user #{User.last}"
    redirect_to "/users"
  end

end
