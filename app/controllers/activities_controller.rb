class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    #should be able to get associated routine from activity
    @routine = Routine.find(params[:routine_id])
    return render plain: "Unauthorized", status: :unauthorized if @routine.user != current_user
    @activities = Activity.new
  end

  def create
    @routine = Routine.find(params[:routine_id])
    return render plain: "Forbidden", status: :forbidden if @routine.user != current_user
    @activity = @routine.activities.create(activity_params)
    if @activity.valid?
      redirect_to routine_path(@routine)
    else
      return render :new, status: :unprocessable_entity
    end
  end


  private

  def activity_params
    params.require(:activity).permit(:name,:description)
  end
end
