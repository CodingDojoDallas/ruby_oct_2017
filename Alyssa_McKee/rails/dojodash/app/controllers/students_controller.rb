class StudentsController < ApplicationController
	def show
		@dojo = Dojo.find(params[:id])
		@student = Student.find(params[:s_id])
		@cohort = @dojo.students.where('not students.id = ?', params[:s_id])
	end
	def new
		@alldojos = Dojo.all
		@dojo = Dojo.find(params[:id])
	end
	
	def edit
		@student = Student.find(params[:s_id])
		@dojo = Dojo.find(params[:id])
		@alldojos = Dojo.all
	end
	def update
		student = Student.find(params[:id])
		dojo = Dojo.find(params[:dojo_id])
		student.update(student_params, dojo: dojo)
		if student.errors.any?
			flash[:notice] = student.errors.full_messages
			return redirect_to "/dojos/#{student.dojo_id}/students/#{student.id}/edit"
		end
		return redirect_to "/dojos/#{student.dojo_id}/students/#{student.id}"
	end
	def create
		dojo = Dojo.find(params[:dojo_id])
		student = dojo.students.create(student_params)
		if student.valid?
			student.save()
			return redirect_to "/dojos/#{dojo.id}"
		end
		flash[:notice] = student.errors.full_messages
		return redirect_to "/dojos/#{dojo.id}/students/new"
	end
	def destroy
		student = Student.find(params[:s_id])
		student.destroy
		redirect_to "/dojos/#{params[:id]}"
	end
	private
		def student_params
			return params.require(:students).permit(:first_name, :last_name, :email)
		end
end