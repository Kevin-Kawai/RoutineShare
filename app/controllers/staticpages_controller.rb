class StaticpagesController < ApplicationController

  def index
    @routines = Routine.all
  end

  def consturction
  end

end
