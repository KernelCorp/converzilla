require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:client) { FactoryGirl.create :client }

  before(:each) {sign_in client}

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to be_success
    end
  end

end
