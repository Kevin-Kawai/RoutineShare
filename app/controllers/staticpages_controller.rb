class StaticpagesController < ApplicationController

  def index
    @routines = Routine.all
  end

end
