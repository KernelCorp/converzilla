require 'rails_helper'
include User
RSpec.describe OperatorsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Operator. As you add validations to Operator, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {email: 'operator@example.com'}
  }

  let(:invalid_attributes) {
    {email: 'operator'}
  }

  let(:operator) { FactoryGirl.create :operator}

  before :each do
    sign_in operator.client
    request.accept = 'application/json'
  end

  describe "GET index" do
    it 'assigns all operators as @operators' do
      get :index, {}
      expect(assigns(:operators)).to eq([operator])
    end
  end

  describe "GET show" do
    it "assigns the requested operator as @operator" do
      get :show, {:id => operator.to_param}
      expect(assigns(:operator)).to eq(operator)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Operator" do
        expect {
          post :create, {:operator => valid_attributes}
        }.to change(Operator, :count).by(1)
      end

      it "assigns a newly created operator as @operator" do
        post :create, {:operator => valid_attributes}
        expect(assigns(:operator)).to be_a(Operator)
      end

      it 'creates a new operator associated with client' do
        post :create, {:operator => valid_attributes}
        expect(assigns(:operator).client).to eq(operator.client)
      end

    end

    describe "with invalid params" do
      it 'responds with status unprocessable_entity' do
        post :create, {:operator => invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      it "updates the requested operator" do
        put :update, {:id => operator.to_param, :operator => valid_attributes}
        expect(operator.reload.email).to eq(valid_attributes[:email])
      end

    end

    describe "with invalid params" do
      it 'responds with status unprocessable_entity' do
        put :update, {id: operator.to_param, operator: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested operator" do
      expect {
        delete :destroy, {:id => operator.to_param}
      }.to change(Operator, :count).by(-1)
    end

  end

end
