require "rails_helper"

RSpec.describe ApplicationCable::Connection, type: :channel do
  it "successfully connects" do
    user = create(:user)

    connect "/cable", session: { user_id: user.id }

    expect(connection.current_user).to eq(user)
  end

  it "rejects connections without a user_id" do
    expect do
      connect "/cable", session: { user_id: nil }
    end.to have_rejected_connection
  end
end
