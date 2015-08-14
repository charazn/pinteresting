require 'rails_helper'

RSpec.describe PinsController, type: :controller do
  include Devise::TestHelpers

  let(:pin) { create(:pin) }
  let(:user) { create(:user) }
  before { sign_in(user) }


  describe "GET #index" do 
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:pins)).to include(pin) }
    it { expect(assigns(:pins)).not_to be_nil }
  end

  describe "GET #show" do
    before { get :show, :id => pin.id }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:pin)).to eq(pin) }
  end

  describe "GET #new" do 
    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:pin)).to be_a_new(Pin) }
  end

  describe "POST #create" do
    before { post :create, :pin => params }

    context "with valid params" do 
      let(:params) { attributes_for(:pin) }

      it { expect(assigns(:pin)).to be_persisted }
      it { expect(response).to redirect_to(Pin.last) }
    end

    context "with invalid params" do
      let(:params) { attributes_for(:pin, :invalid) }

      it { expect(assigns(:pin)).to be_a_new_record}
      it { expect(assigns(:pin)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
    end
  end

  describe "GET #edit" do
    before { get :edit, :id => pin.id }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:pin)).to eq(pin) }

  end

  describe "PATCH #update" do 
    before { patch :update, :id => pin.id, :pin => params }

    context "with valid params" do
      let(:params) { { description: "Description updated"} }

      it { expect(assigns(:pin).description).to eq(params[:description]) }
      it { expect(assigns(:pin)).to be_valid }
      it { expect(response).to redirect_to(pin) }
    end

    context "with invalid params" do 
      let(:params) { attributes_for(:pin, :invalid) }

      it { expect(assigns(:pin)).not_to be_valid }
      it { expect(response).to render_template(:edit) }
    end
  end

  describe "DELETE #destroy" do
    before { delete :destroy, :id => pin.id }

    it { expect(assigns(:pin)).to be_destroyed }
    it { is_expected.to redirect_to(pins_path) }
  end



  # # This should return the minimal set of attributes required to create a valid
  # # Pin. As you add validations to Pin, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # PinsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

  # describe "GET #index" do
  #   it "assigns all pins as @pins" do
  #     pin = Pin.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:pins)).to eq([pin])
  #   end
  # end

  # describe "GET #show" do
  #   it "assigns the requested pin as @pin" do
  #     pin = Pin.create! valid_attributes
  #     get :show, {:id => pin.to_param}, valid_session
  #     expect(assigns(:pin)).to eq(pin)
  #   end
  # end

  # describe "GET #new" do
  #   it "assigns a new pin as @pin" do
  #     get :new, {}, valid_session
  #     expect(assigns(:pin)).to be_a_new(Pin)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested pin as @pin" do
  #     pin = Pin.create! valid_attributes
  #     get :edit, {:id => pin.to_param}, valid_session
  #     expect(assigns(:pin)).to eq(pin)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Pin" do
  #       expect {
  #         post :create, {:pin => valid_attributes}, valid_session
  #       }.to change(Pin, :count).by(1)
  #     end

  #     it "assigns a newly created pin as @pin" do
  #       post :create, {:pin => valid_attributes}, valid_session
  #       expect(assigns(:pin)).to be_a(Pin)
  #       expect(assigns(:pin)).to be_persisted
  #     end

  #     it "redirects to the created pin" do
  #       post :create, {:pin => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Pin.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved pin as @pin" do
  #       post :create, {:pin => invalid_attributes}, valid_session
  #       expect(assigns(:pin)).to be_a_new(Pin)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:pin => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested pin" do
  #       pin = Pin.create! valid_attributes
  #       put :update, {:id => pin.to_param, :pin => new_attributes}, valid_session
  #       pin.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested pin as @pin" do
  #       pin = Pin.create! valid_attributes
  #       put :update, {:id => pin.to_param, :pin => valid_attributes}, valid_session
  #       expect(assigns(:pin)).to eq(pin)
  #     end

  #     it "redirects to the pin" do
  #       pin = Pin.create! valid_attributes
  #       put :update, {:id => pin.to_param, :pin => valid_attributes}, valid_session
  #       expect(response).to redirect_to(pin)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the pin as @pin" do
  #       pin = Pin.create! valid_attributes
  #       put :update, {:id => pin.to_param, :pin => invalid_attributes}, valid_session
  #       expect(assigns(:pin)).to eq(pin)
  #     end

  #     it "re-renders the 'edit' template" do
  #       pin = Pin.create! valid_attributes
  #       put :update, {:id => pin.to_param, :pin => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested pin" do
  #     pin = Pin.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => pin.to_param}, valid_session
  #     }.to change(Pin, :count).by(-1)
  #   end

  #   it "redirects to the pins list" do
  #     pin = Pin.create! valid_attributes
  #     delete :destroy, {:id => pin.to_param}, valid_session
  #     expect(response).to redirect_to(pins_url)
  #   end
  # end

end
