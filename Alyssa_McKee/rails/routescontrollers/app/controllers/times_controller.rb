class TimesController < ApplicationController
  
  def index
	session[:times] ||= 0
	session[:times] += 1
	render text: "you've vissed this page #{session[:times]} times"
	
  end

  def restart
	session[:times] = nil
	render text: "session destroyed"
  end
end
