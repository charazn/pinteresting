require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    before { get :index }

    it { is_expected.to render_template(:index) }
  end

  describe "GET #about" do
    before { get :about }

    it { is_expected.to render_template(:about) }
  end

end
