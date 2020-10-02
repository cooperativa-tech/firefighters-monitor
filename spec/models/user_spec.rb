require "rails_helper"

RSpec.describe User do
  describe "attribute validations" do
    it { is_expected.to validate_presence_of(:username) }
    # TODO: check how to better test this
    # it { is_expected.to validate_presence_of(:password) }
    # it { is_expected.to validate_length_of(:password) }
    # it { is_expected.to validate_presence_of(:password_confirmation) }
    # it { is_expected.to validate_length_of(:password_confirmation) }
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

  describe ".next_status" do
    it "it returns available if the current status is unavailable" do
      user = create(:user, status: "unavailable")

      new_status = user.next_status

      expect(new_status).to eq("available")
    end

    it "it returns service if the current status is available" do
      user = create(:user, status: "available")

      new_status = user.next_status

      expect(new_status).to eq("service")
    end

    it "it returns unavailable if the current status is service" do
      user = create(:user, status: "service")

      new_status = user.next_status

      expect(new_status).to eq("unavailable")
    end
  end

  describe ".next_duty_type" do
    it "it returns picket if the current status is empty" do
      user = create(:user, duty_type: nil)

      new_duty_type = user.next_duty_type

      expect(new_duty_type).to eq("picket")
    end

    it "it returns elac if the current status is picket" do
      user = create(:user, duty_type: "picket")

      new_duty_type = user.next_duty_type

      expect(new_duty_type).to eq("elac")
    end

    it "it returns eip if the current status is elac" do
      user = create(:user, duty_type: "elac")

      new_duty_type = user.next_duty_type

      expect(new_duty_type).to eq("eip")
    end

    it "it returns nothing if the current status is eip" do
      user = create(:user, duty_type: "eip")

      new_duty_type = user.next_duty_type

      expect(new_duty_type).to eq(nil)
    end
  end
end
