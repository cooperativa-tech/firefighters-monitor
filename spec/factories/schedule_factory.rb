FactoryBot.define do
  factory :schedule do
    start_date { Time.now.utc }
    end_date { Faker::Time.forward(days: 15).utc }
    status { User.statuses.keys.sample }
  end
end
