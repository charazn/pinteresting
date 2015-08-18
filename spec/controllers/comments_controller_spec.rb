require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  include Devise::TestHelpers

  let(:pin) { create(:pin) }
  let(:user) { create(:user, pins: [pin]) }
  let(:comment) { create(:comment, commenter: user, commentable: pin) }
  before { sign_in(user) }


  describe "GET #new" do 
    before { get :new, :pin_id => pin.id }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:comment)).to be_a_new(Comment) }
  end

  describe "POST #create" do
    before { post :create, :pin_id => pin.id, :comment => params }

    context "with valid params" do 
      let(:params) { attributes_for(:comment) }

      it { expect(assigns(:comment)).to be_persisted }
      it { expect(response).to redirect_to(assigns(:pin)) }
    end

    context "with invalid params" do
      let(:params) { attributes_for(:comment, :invalid) }

      it { expect(assigns(:comment)).to be_a_new_record}
      it { expect(assigns(:comment)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
    end
  end

  describe "GET #edit" do
    before { get :edit, :pin_id => pin.id, :id => comment.id }

    it { is_expected.to render_template(:edit) }
    it { expect(assigns(:comment)).to eq(comment) }
  end

  describe "PATCH #update" do 
    before { patch :update, :pin_id => pin.id, :id => comment.id, :comment => params }

    context "with valid params" do
      let(:params) { { body: "Description updated"} }

      it { expect(assigns(:comment).body).to eq(params[:body]) }
      it { expect(assigns(:comment)).to be_valid }
      it { expect(response).to redirect_to(assigns(:pin)) }
    end

    context "with invalid params" do 
      let(:params) { attributes_for(:comment, :invalid) }

      it { expect(assigns(:comment)).not_to be_valid }
      it { expect(response).to render_template(:edit) }
    end
  end

end
