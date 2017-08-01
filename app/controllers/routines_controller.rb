class RoutinesController < ApplicationController

  def index
    @routines = Routine.all
  end

  def show
    @routines = Routine.find(params[:id])
  end

  def new
    @routines = Routine.new
  end

  def create
    @routines = current_user.routine.create(routine_params)
    if @routines.valid?
      redirect_to routine_path(@routines)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:name,:description)
  end
end
