class DojosController < ApplicationController
    def index
        @dojos = Dojo.all
    end    
    def new

    end
    def create
        @dojos = Dojo.new(dojo_params)
        
        if @dojos.valid?
            @dojos.save

            return redirect_to root_path
        end

        return redirect_to :back 
    end    
    def show
       @dojos =Dojo.find(params[:id]) 
    end
    def edit
       @dojos =Dojo.find(params[:id]) 
    end
    def update
        @dojos = Dojo.find(params[:id])
        dojos.branch=params[:branch]
        dojos.street=params[:street]
        dojos.city=params[:city]
        dojos.state=params[:state]
        dojos.save
        redirect_to  '/dojos/index'  
    end    
    def destroy
        dojos =Dojo.find(params[:id])
        dojos.delete
        redirect_to '/dojos' 
    end    

    private
    def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
