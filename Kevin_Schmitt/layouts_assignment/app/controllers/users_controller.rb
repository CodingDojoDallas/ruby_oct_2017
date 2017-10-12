class UsersController < ApplicationController
  def index
    @users = User.all.order! 'created_at DESC'
    render 'users/index_users'
  end
  def index_users
  end
  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      return redirect_to :back #goes back to previous page
    end
    # return redirect_to :back
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :favorite_language)
  end
end
