class TestController < ApplicationController
  def hello
    render :text => "Hello CodingDojo!"
  end

  def say
    render :text => "Saying Hello!"
  end

  def show_name
    if params[:name].downcase == 'michael'
      redirect_to "/say/hello/joe"
    else
      render :text => "Saying Hello #{params[:name].capitalize}!"
    end
  end

  def times
    unless session.key?("times") or session[:times] != nil
      session[:times] = 0
    end
    session[:times]+=1
    render :text => "You visited this url #{session[:times]} times."
  end

  def reset
    session[:times] = nil
    redirect_to "/times"
  end
end
