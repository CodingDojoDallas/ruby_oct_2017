class UsersController < ApplicationController
  def index
	render json: User.all
  end

  def show
	render json: User.find(params[:id])
  end

  def edit
	@user = User.find(params[:id])
	@id = params[:id]
	#render edit page
  end

  def update
	puts "UUUUUUUUUUUUUUUUUPPPPPPPPPPPPPPPPPPPPPPDDDDDDDDDDDDDDDDDDDAAAAAAAAAAAAAAAAAAAAAAATTTTTTTTTTTTTTTTTTTTEEEEEEEEEEEEEEE"
	@user = User.find(params[:id])
	puts "/n/n/n/n/n", @user, "/n/n/n/n/n"
	@user.update(name: params[:name])
	redirect_to "/users/#{@user.id}"
  end

  def new
	#render new page
  end

  def create
	User.create(name: params[:name])
	
	redirect_to "/users"
  end

  def total
	render text: "#{User.count}"
  end
end
