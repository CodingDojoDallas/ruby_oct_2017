class GamesController < ApplicationController
	include GamesHelper
	def index
		session[:gold] ||= 0
		@activities = session[:activities] ||= []
		@gold = session[:gold]
	end
	
	def handle
		gold = payout
		addActivity gold, params[:building]		
		return redirect_to root_path
	end
end
