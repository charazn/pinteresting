require 'rails_helper'

RSpec.describe Pin, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:caption) }
  it { should validate_attachment_presence(:image) }
  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image) }

  # enum :status not tested

end
