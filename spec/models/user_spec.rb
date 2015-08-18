require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:pins) }
  it { should validate_presence_of(:username) }
  it { should have_many(:comments_received).class_name('Comment') }
  it { should have_many(:comments_made).class_name('Comment').with_foreign_key(:commenter_id) }

end
