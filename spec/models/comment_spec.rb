require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should validate_presence_of(:body) }
  it { should belong_to(:commentable) }
  it { should belong_to(:commenter).class_name('User') }

end
