FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "cornet.wong#{n}@tinkerbox.com.sg" }
    password 'tinkerbox'
    password_confirmation 'tinkerbox'
  end
end
