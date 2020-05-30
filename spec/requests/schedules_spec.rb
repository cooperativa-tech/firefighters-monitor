require "rails_helper"

RSpec.describe SchedulesController do
  describe "GET #new" do
    it "has a 200 status code" do
      user = create(:user)
      login_user(user)

      get new_schedule_path

      expect(response.status).to eq(200)
    end

    it "redirects to login path if user not logged in" do
      get new_schedule_path

      expect(response).to redirect_to(login_path)
    end
  end

  describe "POST #create" do
    it "changes the user's status" do
      Delayed::Worker.delay_jobs = false
      user = create(:user)
      schedule_params = attributes_for(:schedule)
      login_user(user)

      post schedules_path, params: { schedule: schedule_params }

      user.reload
      expect(response).to redirect_to(new_schedule_path)
      expect(user.status).to eq(schedule_params[:status])
      Delayed::Worker.delay_jobs = true
    end

    it "created a delayed job after creating a schedule" do
      user = create(:user)
      schedule_params = attributes_for(:schedule)
      login_user(user)

      post schedules_path, params: { schedule: schedule_params }

      delayed_job = Delayed::Job.last
      expect(response).to redirect_to(new_schedule_path)
      expect(delayed_job.run_at).to eq(schedule_params[:date])
    end

    it "redirects to login path if user not logged in" do
      schedule = attributes_for(:schedule)

      post schedules_path, params: { schedule: schedule }

      expect(response).to redirect_to(login_path)
    end
  end
end
