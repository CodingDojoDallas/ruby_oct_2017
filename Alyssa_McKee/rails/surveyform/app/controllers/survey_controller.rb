class SurveyController < ApplicationController
  def index
	#render page, flash messages?
  end

  def create
	#Survey.create(params[:survey])
	survey = Survey.new(survey_params)
	if not survey.valid?
		flash[:notice] = survey.errors.full_messages
		return redirect_to '/'
	end
	
	survey.save
	return redirect_to('/result')
  end

  def result
	survey = Survey.last
	@name = survey.name
	@location = survey.location
	@language = survey.language
	@comment = survey.comment
	@times = Survey.count
  end
  
  private
	def survey_params
		params.require(:survey).permit(:name, :location, :language, :comment)
	end
end
