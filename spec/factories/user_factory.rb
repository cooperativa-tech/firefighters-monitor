FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
