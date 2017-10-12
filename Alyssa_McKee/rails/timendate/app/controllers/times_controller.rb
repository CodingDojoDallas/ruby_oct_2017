class TimesController < ApplicationController
  def main
	@time = Time.now.strftime("%I:%M %p")
	@date = DateTime.now.strftime("%h %d, %Y")
  end
end
