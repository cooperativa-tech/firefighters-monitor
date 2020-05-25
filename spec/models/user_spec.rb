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

      user.toggle_status

      expect(user.status).to eq("available")
    end

    it "changes the status from available to service" do
      user = create(:user, status: "available")

      user.toggle_status

      expect(user.status).to eq("service")
    end

    it "changes the status from service to unavailable" do
      user = create(:user, status: "service")

      user.toggle_status

      expect(user.status).to eq("unavailable")
    end
  end

  describe ".toggle_duty_type" do
    it "changes the status from nil to picket" do
      user = create(:user, duty_type: nil)

      user.toggle_duty_type

      expect(user.duty_type).to eq("picket")
    end

    it "changes the status from picket to elac" do
      user = create(:user, duty_type: "picket")

      user.toggle_duty_type

      expect(user.duty_type).to eq("elac")
    end

    it "changes the status from elac to eip" do
      user = create(:user, duty_type: "elac")

      user.toggle_duty_type

      expect(user.duty_type).to eq("eip")
    end

    it "changes the status from eip to nil" do
      user = create(:user, duty_type: "eip")

      user.toggle_duty_type

      expect(user.duty_type).to eq(nil)
    end
  end
end
