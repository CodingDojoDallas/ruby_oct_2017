class SurveyController < ApplicationController
  def index
  end

  def submit
    Surveyy.create(user_params)
    flash[:submissions] = Surveyy.all.length
    redirect_to "/result"
  end

  def result
    @surveyy = Surveyy.last
    @submissions = Surveyy.all.length
  end

  private

  def user_params
    params.require(:surveyy).permit(:name, :location, :language, :comment)
  end
end
