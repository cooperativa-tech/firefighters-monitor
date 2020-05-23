require "rails_helper"

RSpec.describe User, type: :model do
  describe "attribute validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_length_of(:password_confirmation) }
    it { should validate_confirmation_of(:password) }

    it "should not validate password if it's unchanged on existing record" do
      user = create(:user)

      user.password = nil
      user.save

      expect(user).to be_valid
    end

    it "should validate password if it's changed on existing record" do
      user = create(:user)

      user.password = "no_confirmation"
      user.save

      expect(user).to_not be_valid
    end
  end

  describe ".toggle_status" do
    it "changes the status from unavailable to available" do
      user = create(:user, status: "unavailable")

      returned_status = user.toggle_status

      expect(user.status).to eq("available")
      expect(returned_status).to eq("available")
    end

    it "changes the status from available to service" do
      user = create(:user, status: "available")

      returned_status = user.toggle_status

      expect(user.status).to eq("service")
      expect(returned_status).to eq("service")
    end

    it "changes the status from service to unavailable" do
      user = create(:user, status: "service")

      returned_status = user.toggle_status

      expect(user.status).to eq("unavailable")
      expect(returned_status).to eq("unavailable")
    end
  end
end
