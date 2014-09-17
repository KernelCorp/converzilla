require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe VisitorsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Inquire. As you add validations to Inquire, be sure to
  # adjust the attributes here as well.


  before(:each) {request.accept = 'application/json'}

  describe "GET index" do
    context 'as client' do
      include_context 'signed in as client'
      it "assigns all client's visitors as @visitors" do
        get :index
        expect(assigns(:visitors).to_a).to eq(client.visitors)
      end
    end
    context 'as operator' do
      include_context 'signed in as operator'
      it "assigns all client's visitors as @visitors" do
        get :index
        expect(assigns(:visitors).to_a).to eq(operator.client.visitors)
      end
    end
  end

  describe "GET show" do
    context 'as client' do
      include_context 'signed in as client'

      let(:visitor) { FactoryGirl.create :visitor, client: client}

      it "assigns the requested visitor as @visitor" do
        get :show, {:id => visitor.to_param}
        expect(assigns(:visitor)).to eq(visitor)
      end
    end
    context 'as operator' do
      include_context 'signed in as operator'

      let(:visitor) { FactoryGirl.create :visitor, client: operator.client}

      it "assigns the requested visitor as @visitor" do
        get :show, {:id => visitor.to_param}
        expect(assigns(:visitor)).to eq(visitor)
      end
    end
  end


  describe 'POST create' do

    let(:client) { FactoryGirl.create :client }

    let(:valid_attributes) { {vk_user_info: {last_name: 'name'}} }

    context 'with valid params' do
      it 'set vk last name' do
        post :create, {client_id: client.to_param, visitor: valid_attributes}
        expect(assigns(:visitor).vk_user_info.last_name).to eq('name')
      end
    end

    it 'response 404 if clients_id is not correct' do
      expect{
        post :create, {client_id: 'fake', visitor: valid_attributes}
      }.to raise_error(Mongoid::Errors::DocumentNotFound)
    end

    it 'responds with status unprocessable_entity if clients_id is blank' do
      post :create, {visitor: valid_attributes}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE destroy" do
    context 'as client' do
      include_context 'signed in as client'

      it 'destroys the requested visitor' do
        expect {
          delete :destroy, {id: client.visitors.first.to_param}
        }.to change{client.reload.visitors.count}.by(-1)
      end
    end

    context 'as operator' do
      include_context 'signed in as operator'

      let(:visitor) { FactoryGirl.create :visitor, client: operator.client}

      it 'access denied' do
        expect {
          delete :destroy, {id: visitor.to_param}
        }.to raise_error(CanCan::AccessDenied)
      end
    end


  end

end