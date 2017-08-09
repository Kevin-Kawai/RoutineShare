class StaticpagesController < ApplicationController

  def index
    @routines = Routine.all
  end

  def construction
  end

end
