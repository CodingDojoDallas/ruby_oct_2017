class TimesController < ApplicationController
  def main
    t = Time.now.in_time_zone("Central Time (US & Canada)")
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    p t
    @date = t.strftime("%b %-d, %Y")
    puts @date
    @time = t.strftime("%-I:%M %p")
    puts @time
  end
end
