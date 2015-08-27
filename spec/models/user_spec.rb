require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_confirmation_of(:password) }
  it { should validate_presence_of(:password_confirmation) }

  it { should have_many(:pins) }

  it { should have_many(:comments_received).class_name('Comment') }
  it { should have_many(:comments_made).class_name('Comment').with_foreign_key(:commenter_id) }

  # enum :status not tested

  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image) }

end
