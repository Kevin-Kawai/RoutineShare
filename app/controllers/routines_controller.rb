class RoutinesController < ApplicationController

  def index
    @routines = Routine.all
  end

  def show
    @routines = Routine.find(params[:id])
  end

end
