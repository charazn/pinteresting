require 'rails_helper'

RSpec.describe "pins/show", type: :view do
  before(:each) do
    @pin = assign(:pin, Pin.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
