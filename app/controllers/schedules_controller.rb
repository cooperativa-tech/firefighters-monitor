class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @statuses = User.statuses.keys
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @statuses = User.statuses.keys

    if @schedule.valid?
      schedule_status_change(@schedule)

      redirect_to(new_schedule_path, notice: "Scheduled!")
    else
      flash.now[:alert] = "Invalid!"

      render action: "new", status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_date, :end_date, :status)
  end

  def schedule_status_change(schedule)
    user_updater = UserUpdater.new(user: current_user)
    user_updater.delay(run_at: schedule.start_date.utc).toggle_status(schedule.status)
    user_updater.delay(run_at: schedule.end_date.utc).toggle_status(:unavailable)
  end
end
