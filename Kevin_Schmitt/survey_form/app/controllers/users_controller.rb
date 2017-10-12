class UsersController < ApplicationController
  def index
    render 'users/index'
  end

  def success
    session['times']=User.all.count
    @times = session['times']
    @user = User.last
    @users = User.all.order! 'created_at DESC'
    render 'users/success'
  end
  def create
    puts user_params
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      redirect_to '/success'
    end
    def destroy_session
      session['times']=0
      render 'users/destroy'
    end
  end
  # def create
  #   @user = User.create(
  #     name: params[:name],
  #     location: params[:location],
  #     language: params[:language],
  #     comment: params[:comment]
  #   )
  #   return redirect_to root_path
  # end
  private
    def user_params
      params.require(:user).permit(:name, :location, :language, :comment)
    end
end
