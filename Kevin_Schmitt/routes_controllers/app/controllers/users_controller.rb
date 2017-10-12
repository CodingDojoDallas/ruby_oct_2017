class UsersController < ApplicationController
  
  # def index
  #   render 'users/whattosay'
  # end
  def index
    render json: User.all
  end
  def hello
    render 'users/hello'
  end
  def sayinghello
    render 'users/sayinghello'
  end

  def hellojoe
    render 'users/hellojoe'
  end
  def times
    session['times'] += 1
    @times = session['times']
    render 'users/times'
  end
  def destroy_session
    session['times']=0
    render 'users/destroy'
  end
  def create
    @user = User.new(user_params)

    if @user.save!
      redirect_to @user
    end
  end
end


private

  def user_params
    params.require(:user).permit(:name, :email)
  end