require 'rails_helper'

RSpec.describe PinsController, type: :controller do
  # include Devise::TestHelpers

  let(:pin) { create(:pin) }
  let(:user) { create(:user, pins: [pin]) }
  before { login_user(user) }


  # describe "GET #index" do 
  #   before { get :index }

  #   it { is_expected.to render_template(:index) }
  #   it { expect(assigns(:pins)).to include(pin) }
  #   it { expect(assigns(:pins)).not_to be_nil }
  # end

  # describe "GET #show" do
  #   before { get :show, :id => pin.id }

  #   it { is_expected.to render_template(:show) }
  #   it { expect(assigns(:pin)).to eq(pin) }
  # end

  # describe "GET #new" do 
  #   before { get :new }

  #   it { is_expected.to render_template(:new) }
  #   it { expect(assigns(:pin)).to be_a_new(Pin) }
  # end

  # describe "POST #create" do
  #   before { post :create, :pin => params }

  #   context "with valid params" do 
  #     let(:params) { attributes_for(:pin) }

  #     it { expect(assigns(:pin)).to be_persisted }
  #     it { expect(response).to redirect_to(Pin.last) }
  #   end

  #   context "with invalid params" do
  #     let(:params) { attributes_for(:pin, :invalid) }

  #     it { expect(assigns(:pin)).to be_a_new_record}
  #     it { expect(assigns(:pin)).not_to be_persisted }
  #     it { expect(response).to render_template(:new) }
  #   end
  # end

  # describe "GET #edit" do
  #   before { get :edit, :id => pin.id }

  #   it { is_expected.to render_template(:edit) }
  #   it { expect(assigns(:pin)).to eq(pin) }
  # end

  # describe "PATCH #update" do 
  #   before { patch :update, :id => pin.id, :pin => params }

  #   context "with valid params" do
  #     let(:params) { { caption: "Caption updated"} }

  #     it { expect(assigns(:pin).caption).to eq(params[:caption]) }
  #     it { expect(assigns(:pin)).to be_valid }
  #     it { expect(response).to redirect_to(pin) }
  #   end

  #   context "with invalid params" do 
  #     let(:params) { attributes_for(:pin, :invalid) }

  #     it { expect(assigns(:pin)).not_to be_valid }
  #     it { expect(response).to render_template(:edit) }
  #   end
  # end

  # describe "PUT #archive" do
  #   before { put :archive, :id => pin.id, :user => user }

  #   it { expect(assigns(:pin).status).to eq('archived') }
  #   it { expect(assigns(:pin)).to redirect_to(pins_path) }
  # end

  # describe "PUT #upvote" do
  #   context "vote count will increase by 1" do
  #     it { expect{ put :upvote, :id => pin.id }.to change{ pin.votes_for.up.count }.by(+1) }
  #   end

  #   context "upvoter is the current user" do
  #     before { put :upvote, :id => pin.id }

  #     it { expect(assigns(:pin).votes_for.up.by_type(User).voters.first).to eq(user) }
  #     it { expect(response).to redirect_to(pin) }
  #   end
  # end

  describe "PUT #undo_upvote" do
    context "vote count will decrease by 1" do
      before { put :upvote, :id => pin.id }

      it { expect{ put :undo_upvote, :id => pin.id }.to change{ pin.votes_for.up.count }.by(-1) }
    end

    context "pin has no voters" do
      before { put :upvote, :id => pin.id }
      before { put :undo_upvote, :id => pin.id }

      it { expect(assigns(:pin).votes_for.by_type(User).voters.first).to eq(nil) }
      it { expect(response).to redirect_to(pin) }
    end
  end

  # describe "DELETE #destroy" do
  #   before { delete :destroy, :id => pin.id }

  #   it { expect(assigns(:pin)).to be_destroyed }
  #   it { is_expected.to redirect_to(pins_path) }
  # end

end
