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

RSpec.describe InquiresController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Inquire. As you add validations to Inquire, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  before(:each) {request.accept = 'application/json'}



  describe "GET index" do
    context 'as client' do
      include_context 'signed in as client'
      it "assigns all client's inquires as @inquires" do
        get :index
        expect(assigns(:inquires)).to eq(client.inquires)
      end
    end
    context 'as operator' do
      include_context 'signed in as operator'
      it "assigns all client's inquires as @inquires" do
        get :index
        expect(assigns(:inquires)).to eq(operator.client.inquires)
      end
    end
  end

  describe "GET show" do
    it "assigns the requested inquire as @inquire" do
      inquire = Inquire.create! valid_attributes
      get :show, {:id => inquire.to_param}
      expect(assigns(:inquire)).to eq(inquire)
    end
  end

  describe "GET new" do
    it "assigns a new inquire as @inquire" do
      get :new, {}
      expect(assigns(:inquire)).to be_a_new(Inquire)
    end
  end

  describe "GET edit" do
    it "assigns the requested inquire as @inquire" do
      inquire = Inquire.create! valid_attributes
      get :edit, {:id => inquire.to_param}
      expect(assigns(:inquire)).to eq(inquire)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Inquire" do
        expect {
          post :create, {:inquire => valid_attributes}
        }.to change(Inquire, :count).by(1)
      end

      it "assigns a newly created inquire as @inquire" do
        post :create, {:inquire => valid_attributes}
        expect(assigns(:inquire)).to be_a(Inquire)
        expect(assigns(:inquire)).to be_persisted
      end

      it "redirects to the created inquire" do
        post :create, {:inquire => valid_attributes}
        expect(response).to redirect_to(Inquire.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inquire as @inquire" do
        post :create, {:inquire => invalid_attributes}
        expect(assigns(:inquire)).to be_a_new(Inquire)
      end

      it "re-renders the 'new' template" do
        post :create, {:inquire => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested inquire" do
        inquire = Inquire.create! valid_attributes
        put :update, {:id => inquire.to_param, :inquire => new_attributes}
        inquire.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested inquire as @inquire" do
        inquire = Inquire.create! valid_attributes
        put :update, {:id => inquire.to_param, :inquire => valid_attributes}
        expect(assigns(:inquire)).to eq(inquire)
      end

      it "redirects to the inquire" do
        inquire = Inquire.create! valid_attributes
        put :update, {:id => inquire.to_param, :inquire => valid_attributes}
        expect(response).to redirect_to(inquire)
      end
    end

    describe "with invalid params" do
      it "assigns the inquire as @inquire" do
        inquire = Inquire.create! valid_attributes
        put :update, {:id => inquire.to_param, :inquire => invalid_attributes}
        expect(assigns(:inquire)).to eq(inquire)
      end

      it "re-renders the 'edit' template" do
        inquire = Inquire.create! valid_attributes
        put :update, {:id => inquire.to_param, :inquire => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested inquire" do
      inquire = Inquire.create! valid_attributes
      expect {
        delete :destroy, {:id => inquire.to_param}
      }.to change(Inquire, :count).by(-1)
    end

    it "redirects to the inquires list" do
      inquire = Inquire.create! valid_attributes
      delete :destroy, {:id => inquire.to_param}
      expect(response).to redirect_to(inquires_url)
    end
  end

end