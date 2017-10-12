class RpgController < ApplicationController
  def index
  	@goldcount = session[:gold]
  	@results = session[:results]
  end

  def getgold

  	session[:results] ||= []	
  	session[:gold] ||= 0


  	if params[:place] == "cave"
  		gold = rand(5..10)
  		session[:gold] += gold
  		session[:results] << "You won #{gold} golds at the cave. #{ (Time.now) }"
  		return redirect_to "/rpg/index"
  	end	

  	if params[:place] == "farm"
  		gold = rand(10..20)
  		session[:gold] += gold
  		session[:results] << "You won #{gold} golds at the farm. #{ (Time.now) }"
  		return redirect_to "/rpg/index"
  	end

  	if params[:place] == "house"
  		gold = rand(25..50)
  		session[:gold] += gold
  		session[:results] << "You won #{gold} golds at the house. #{ (Time.now) }"
  		return redirect_to "/rpg/index"
  	end 

  	if params[:place] == "casino"
 		gold = rand(-100..100)	
 		if gold < 0
 			session[:gold] += gold
 			session[:results] << "You lost #{gold} golds at the casino. Gambling is stupid. #{ (Time.now) }"
 			return redirect_to "/rpg/index"
 		else 
 			session[:gold] += gold
 			session[:results] << "You won #{gold} golds at the casino. Gambling is stupid. #{ (Time.now) }"
 			return redirect_to "/rpg/index"
 		end
 	end 
end

	def clear
		reset_session
		return redirect_to "/rpg/index"
	end
end
