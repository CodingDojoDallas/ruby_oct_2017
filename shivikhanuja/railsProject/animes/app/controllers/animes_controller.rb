class AnimesController < ApplicationController
    def index
      @animes = Anime.all  
    end    
    def new

    end
    
    def make
      Anime.create(name: params[:name])
      redirect_to '/animes'
    end    
    def show
       @animes = Anime.find(params[:id])
    end    

    def edit
       @animes =Anime.find(params[:id])  
    end 
    def update
        animes = Anime.find(params[:id])
        animes.name=params[:name]
        animes.save
        redirect_to  '/animes'  
    end    
    def delete
      animes =Anime.find(params[:id])
      animes.delete
      redirect_to '/animes' 
    end    

end
