require 'rails_helper'

RSpec.describe Pin, type: :model do

  it { should validate_presence_of(:description) }
  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }

end
