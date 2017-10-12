class Team < ActiveRecord::Base
    has_many :players


    players = Player.limit(10).order("RANDOM()")
    players.each do |player|
      puts player.team.stadium
    end
end
