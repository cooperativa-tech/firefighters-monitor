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

      render action: "new"
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date, :status)
  end

  def schedule_status_change(schedule)
    user_updater = UserUpdater.new(user: current_user)
    user_updater.delay(run_at: schedule.date).toggle_status(schedule.status)
  end
end
