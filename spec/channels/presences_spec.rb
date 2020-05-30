require "rails_helper"

RSpec.describe PresencesChannel do
  it "confirms the subscription" do
    user = create(:user, :admin)
    stub_connection current_user: user

    subscribe

    expect(subscription).to be_confirmed
  end

  it "rejects the subscription if not an admin" do
    user = create(:user)
    stub_connection current_user: user

    subscribe

    expect(subscription).to be_rejected
  end
end
