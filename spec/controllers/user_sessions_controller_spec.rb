require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  let(:user) { create(:user) }

  describe "GET #new" do
    before { get :new }
    it { is_expected.to render_template(:new) }
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, email: user.email, password: 'tinkerbox' }

      it { expect(assigns(:user)).to eq(user) }
      it { expect(response).to redirect_to(pins_path) }
    end

    context "with invalid params invalid password" do
      before { post :create, email: user.email, password: 'wrong_password' }
 
      it { expect(response).to render_template(:new) }
    end

    context "with invalid params blank email" do
      before { post :create, email: '' }

      it { expect(response).to render_template(:new) }
    end

    context "with invalid params invalid email" do
      before { post :create, email: '123@abc.com.sg' }

      it { expect(response).to render_template(:new) }
    end
  end

  describe "DELETE #destroy" do
    before do 
      login_user(user)
      post :destroy, :id => user.id
    end

    it { expect(flash[:notice]).to eq('You have successfully logged out') }
    it { expect(response).to redirect_to(root_path) }
  end

end
