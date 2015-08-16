FactoryGirl.define do
  factory :pin do
    description "MyString"
  end

  trait :invalid do
    description ""
  end

end
