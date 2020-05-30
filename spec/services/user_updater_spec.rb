require "rails_helper"

RSpec.describe UserUpdater do
  it "updates the status of a user" do
    user = create(:user)
    user_updater = UserUpdater.new(user: user)
    new_status = User.statuses.keys.sample

    user_updater.toggle_status(new_status)

    user.reload
    expect(user.status).to eq(new_status)
  end

  it "updates the duty type of a user" do
    user = create(:user)
    user_updater = UserUpdater.new(user: user)
    new_duty_type = User.duty_types.keys.sample

    user_updater.toggle_duty_type(new_duty_type)

    user.reload
    expect(user.duty_type).to eq(new_duty_type)
  end
end
