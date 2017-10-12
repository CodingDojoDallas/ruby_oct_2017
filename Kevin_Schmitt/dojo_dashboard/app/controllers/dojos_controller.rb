class DojosController < ApplicationController
  def new
    if session['error'].length>1
      @error =  session['error']
    end
    render 'dojos/new'
  end
  def create
    @dojo = Dojo.new(dojo_params)
    if @dojo.valid?
      session['error'] = ''
      @dojo.save
      redirect_to '/'
    elsif !@dojo.valid?
      session['error'] = 'Fields must be at least 2 characters'
      redirect_to '/new'
    end
  end
  def showone
    @one = Dojo.find(params[:id])
    @students = Student.where(dojo_id: params[:id])
    render 'dojos/showone'
  end
  def delete
    go = Dojo.find(params[:id])
    go.delete
    return redirect_to '/'     #:back #goes back to previous page
  end
  def edit
    @one = Dojo.find(params[:id])
    render 'dojos/edit'
  end
  def update
    dj = Dojo.find(params[:id])
    dj.update(dojo_params)
    redirect_to '/'
  end
  def show   
    session['error'] = ''
    @count = Dojo.all.count
    @dojos = Dojo.all.order! 'created_at DESC'
    render 'dojos/show'
  end
  def new_student
    @dojo = Dojo.find(params[:id])
    render 'dojos/student_new'
  end
  def create_student
    student = Student.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      dojo_id: params[:id]
    )
    puts student.valid?
    puts student.errors
    if student.valid?
      student.save
      return redirect_to '/' 
    end
    return redirect_to :back #goes back to previous page
  end
  def edit_student
    @student = Student.find(params[:id])
    render 'dojos/student_edit'
  end
  def update_student
    student = Student.find(params[:id])
    student.update(student_params)
    redirect_to "/show/#{student.dojo.id}"
  end
  def delete_student
    go = Student.find(params[:id])
    go.delete
    return redirect_to :back     #:back #goes back to previous page
  end
  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email)
    end
end
