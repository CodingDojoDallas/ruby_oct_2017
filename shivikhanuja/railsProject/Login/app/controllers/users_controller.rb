class UsersController < ApplicationController
    def new

    end
    
    def create
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id

            return redirect_to user_path user.id
        end
        
        flash[:errors] = user.errors.full_messages
        return redirect_to :back
    end
    
    def show
        @user = User.find(session[:user_id])
    end 
    
    private
        def user_params
           params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation) 
        end    
end
        

