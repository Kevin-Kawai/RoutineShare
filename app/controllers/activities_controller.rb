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

  def update
    @activity = Activity.find(params[:id])
    @activity.update_attributes(activity_params)
    render plain: 'Updated!'
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to routine_path(params[:routine_id])
  end

  def edit
    activity = Activity.find(params[:id])
    render json: activity
  end

  private

  def activity_params
    params.require(:activity).permit(:name,:description,:row_order_position)
  end
end
