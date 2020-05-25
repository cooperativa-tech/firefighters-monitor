FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password { "foobar" }
    password_confirmation { "foobar" }
    role { "regular" }
    status { User.statuses.keys.sample }
    duty_type { User.duty_types.keys.sample }

    trait :admin do
      role { "admin" }
    end
  end
end
