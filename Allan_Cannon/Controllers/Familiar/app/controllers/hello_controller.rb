class HelloController < ApplicationController
  def hello
    render :text => "Hello CodingDojo!"
  end
end
