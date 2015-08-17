include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :pin do
    description "MyString"
    image { fixture_file_upload(File.join(Rails.root, 'spec', 'fixtures', 'images', 'puppy1.jpeg'), 'image/jpeg') }
  end

  trait :invalid do
    description ""
  end

end
