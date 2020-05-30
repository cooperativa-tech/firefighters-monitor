require "rails_helper"

RSpec.feature "Authentication", js: true do
  it "redirects user to login if not logged in" do
    visit new_schedule_path

    expect(current_path).to eq(login_path)
  end

  it "schedules a status change for a given date" do
    user = create(:user)
    schedule_params = attributes_for(:schedule)
    login_user(user)

    visit new_schedule_path
    fill_in("schedule[date]", with: schedule_params[:date])
    select(schedule_params[:status], from: "schedule[status]")
    click_on("commit")

    expect(page).to have_content("Scheduled!")
    delayed_job = Delayed::Job.last
    expect(delayed_job.run_at).to be_within(1.minute).of(schedule_params[:date])
    expect(current_path).to eq(new_schedule_path)
  end

  it "changes the status of a user" do
    Delayed::Worker.delay_jobs = false
    user = create(:user)
    schedule_params = attributes_for(:schedule)
    login_user(user)

    visit new_schedule_path
    fill_in("schedule[date]", with: schedule_params[:date])
    select(schedule_params[:status], from: "schedule[status]")
    click_on("commit")

    expect(page).to have_content("Scheduled!")
    user.reload
    expect(user.status).to eq(schedule_params[:status])
    expect(current_path).to eq(new_schedule_path)
    Delayed::Worker.delay_jobs = true
  end
end
