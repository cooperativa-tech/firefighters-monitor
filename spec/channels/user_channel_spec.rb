require "rails_helper"

RSpec.describe UserChannel, type: :channel do
  it "rejects when there is no user_id" do
    subscribe

    expect(subscription).to be_rejected
  end

  it "subscribes to a user stream" do
    user = create(:user)

    subscribe(user_id: user.id)

    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_for(user)
  end

  it "broadcasts status updates" do
    user = create(:user)
    subscribe(user_id: user.id)

    expect do
      perform :toggle
    end.to have_broadcasted_to(user)
  end
end
