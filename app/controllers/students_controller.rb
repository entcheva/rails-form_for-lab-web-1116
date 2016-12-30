class StudentsController < ApplicationController

  def index
    # show all items
    @students = Student.all
  end

  def new
    # show new form
    @student = Student.new
  end

  def create
    # create an item
    @student = Student.create(student_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  def show
    # show item with :id
    @student = Student.find(params[:id])
  end

  def edit
    # show edit form for item with :id
    @student = Student.find(params[:id])
  end

  def update
    # update item with :id
    @student = Student.find(params[:id])
    @student.update(params.require(:student).permit(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  private

  def student_params(*args)
    params.require(:student).permit(*args)
  end


end
