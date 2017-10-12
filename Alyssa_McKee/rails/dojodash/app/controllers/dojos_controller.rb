class DojosController < ApplicationController
	def index
		@dojos = Dojo.all
	end	
	def new
		
	end
	def create
		dojo = Dojo.new(dojo_params)
		if dojo.valid?
			dojo.save()
			return redirect_to landing_path
		end
		flash[:notice] = dojo.errors.full_messages
		return redirect_to "/dojos/new"
	end
	
	def show
		@dojo = Dojo.find(params[:id])
		@students = @dojo.students
	end
	def edit
		@dojo = Dojo.find(params[:id])
	end
	def update
		dojo = Dojo.find(params[:id])
		dojo.update(dojo_params)
		if dojo.errors.any?
			flash[:notice] = dojo.errors.full_messages
			return redirect_to "/dojos/#{dojo.id}/edit"
		end
		return redirect_to "/dojos/#{dojo.id}"
	end
	def destroy
		dojo = Dojo.find(params[:id])
		dojo.destroy
		redirect_to landing_path
	end
	
	private
		def dojo_params
			return params.require(:dojos).permit(:branch, :street, :city, :state)
		end
end