class RpgController < ApplicationController
  def index
    unless session.key?("gold")
      session[:gold] = 0
      puts 'ran this'
    end
    unless session.key?("activities")
      session[:activities] = []
      puts 'and this'
    end
    @gold = session[:gold]
    @activities = session[:activities]
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%"
    p @activities
    p session[:activities]
  end

  def processor
    p session[:gold]
    p session[:activities]
    if params.key?("farm")
      gold_gained=rand(11)+10
      session[:activities] << {"location" => "farm", "amount" => gold_gained}
      session[:gold]+=gold_gained
    elsif params.key?("cave")
      gold_gained=rand(6)+5
      session[:activities] << {"location" => "cave", "amount" => gold_gained}
      session[:gold]+=gold_gained
    elsif params.key?("house")
      gold_gained=rand(4)+2
      session[:activities] << {"location" => "house", "amount" => gold_gained}
      session[:gold]+=gold_gained
    elsif params.key?("casino")
      gold_gained=rand(101)-50
      session[:activities] << {"location" => "casino", "amount" => gold_gained}
      session[:gold]+=gold_gained
    elsif params.key?("reset")
      session[:gold] = 0
      session[:activities] = []
    end
    puts 'successful!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    p session[:activities]
    redirect_to "/"
  end
end
