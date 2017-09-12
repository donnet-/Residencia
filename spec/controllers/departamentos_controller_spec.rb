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
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe DepartamentosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Departamento. As you add validations to Departamento, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DepartamentosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      departamento = Departamento.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      departamento = Departamento.create! valid_attributes
      get :show, {:id => departamento.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      departamento = Departamento.create! valid_attributes
      get :edit, {:id => departamento.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Departamento" do
        expect {
          post :create, {:departamento => valid_attributes}, valid_session
        }.to change(Departamento, :count).by(1)
      end

      it "redirects to the created departamento" do
        post :create, {:departamento => valid_attributes}, valid_session
        expect(response).to redirect_to(Departamento.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:departamento => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested departamento" do
        departamento = Departamento.create! valid_attributes
        put :update, {:id => departamento.to_param, :departamento => new_attributes}, valid_session
        departamento.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the departamento" do
        departamento = Departamento.create! valid_attributes
        put :update, {:id => departamento.to_param, :departamento => valid_attributes}, valid_session
        expect(response).to redirect_to(departamento)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        departamento = Departamento.create! valid_attributes
        put :update, {:id => departamento.to_param, :departamento => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested departamento" do
      departamento = Departamento.create! valid_attributes
      expect {
        delete :destroy, {:id => departamento.to_param}, valid_session
      }.to change(Departamento, :count).by(-1)
    end

    it "redirects to the departamentos list" do
      departamento = Departamento.create! valid_attributes
      delete :destroy, {:id => departamento.to_param}, valid_session
      expect(response).to redirect_to(departamentos_url)
    end
  end

end
