class UsersController < ApplicationController
  def index
    puts "*****youre in the index method*****"
    render json: User.all
  end

  def create
    puts "*****youre in the create method*****"
    @user = User.new(user_params)
      if @user.valid?
        @user.save
        return redirect_to root_path
      end

    return redirect_to '/new'
  end
  def new
    puts "*****youre in the new method*****"
    # this automatically knows you want to render the new.html.erb
  end

  def edit
    puts "*****youre in the edit method*****"
    user = User.find(params[:id])
    @name = user.name
  end

  def patch
    puts "*****youre in the patch method*****"
    user = User.find(params[:id])
    user.update(user_params)
    user.save
    return redirect_to root_path
  end
  # def show
  #   puts "*****youre in the show method*****"
  #   render text: "This is the show page"
  # end
  def show
    render json: User.find(params[:id])
  end

  def total
    puts "*****youre in the total method*****"
    user = User.all
    @count = user.length
    render text: "this is the total number of users: #{@count}"
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
