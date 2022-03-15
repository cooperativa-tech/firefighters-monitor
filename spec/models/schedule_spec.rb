require "rails_helper"

RSpec.describe Schedule do
  describe "attribute validations" do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }

    it "should be valid it start_date is before end_date" do
      schedule = build(:schedule)

      expect(schedule).to be_valid
    end

    it "should be valid it start_date is before end_date" do
      schedule = build(:schedule, end_date: Faker::Time.backward(days: 15).utc)

      expect(schedule).to be_invalid
    end
  end
end
