FactoryBot.define do
  factory :schedule do
    date { Faker::Time.forward(days: 15).utc }
    status { User.statuses.keys.sample }
  end
end
