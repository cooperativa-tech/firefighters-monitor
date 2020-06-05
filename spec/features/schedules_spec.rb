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
    fill_in_date("schedule[start_date]", with: schedule_params[:start_date])
    fill_in_date("schedule[end_date]", with: schedule_params[:end_date])
    select(schedule_params[:status], from: "schedule[status]")
    click_on("commit")

    expect(page).to have_content("Scheduled!")
    first_delayed_job = Delayed::Job.first
    last_delayed_job = Delayed::Job.last
    expect(first_delayed_job.run_at).to be_within(1.minute).of(schedule_params[:start_date])
    expect(last_delayed_job.run_at).to be_within(1.minute).of(schedule_params[:end_date])
    expect(current_path).to eq(new_schedule_path)
  end

  private

  def fill_in_date(name, with:)
    page.execute_script("document.querySelector(\"input[name='#{name}']\").value = \"#{with}\"")
  end
end
