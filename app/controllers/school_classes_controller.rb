class SchoolClassesController < ApplicationController

  def index
    # show all items
    @school_classes = SchoolClass.all
  end

  def new
    # show new form
    @school_class = SchoolClass.new
  end

  def create
    # create an item
    @school_class = SchoolClass.create(school_class_params(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

  def show
    # show item with :id
    @school_class = SchoolClass.find(params[:id])
  end

  def edit
    # show edit form for item with :id
    @school_class = SchoolClass.find(params[:id])
  end

  def update
    # update item with :id
    @school_class = SchoolClass.find(params[:id])
    @school_class.update(params.require(:school_class).permit(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

  private

  def school_class_params(*args)
    params.require(:school_class).permit(*args)
  end


end
