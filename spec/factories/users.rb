FactoryGirl.define do
  factory :user do
    username 'Ted'
    sequence(:email) { |n| "ted#{n}@tinkerbox.com.sg" }
    password 'tinkerbox'
    password_confirmation 'tinkerbox'
  
    trait :invalid do
      email ''
    end
  end
end
