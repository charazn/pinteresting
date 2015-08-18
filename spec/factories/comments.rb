FactoryGirl.define do
  factory :comment do
    body "First comment made by Ted"
    # Apparently, adding the below as attributes does not work.
    # It is better? to set the association at the creation of a comment in the comments_controller test.
      # pin
      # user
      # commentable_id 8
      # commentable_type Pin
      # commenter_id user
  
    trait :invalid do
      body ""
    end  
  end
end
