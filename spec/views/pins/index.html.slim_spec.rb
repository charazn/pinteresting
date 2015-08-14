require 'rails_helper'

RSpec.describe "pins/index", type: :view do
  before(:each) do
    assign(:pins, [
      Pin.create!(
        :description => "Description"
      ),
      Pin.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of pins" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
