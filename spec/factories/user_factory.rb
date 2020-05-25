FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password { "foobar" }
    password_confirmation { "foobar" }
    status { User.statuses.keys.sample }
    duty_type { User.duty_types.keys.sample }
  end
end
