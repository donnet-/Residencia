require 'rails_helper'

RSpec.describe CatDocumentosController, type: :controller do

  let(:valid_attributes) {
    {nom_documento: "solucitud"}
  }

  let(:invalid_attributes) {
    {nom_documento: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CatDocumentosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cat_documento = CatDocumento.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cat_documento = CatDocumento.create! valid_attributes
      get :show, {:id => cat_documento.to_param}, valid_session
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
      cat_documento = CatDocumento.create! valid_attributes
      get :edit, {:id => cat_documento.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new CatDocumento" do
        expect {
          post :create, {:cat_documento => valid_attributes}, valid_session
        }.to change(CatDocumento, :count).by(1)
      end

      it "redirects to the created cat_documento" do
        post :create, {:cat_documento => valid_attributes}, valid_session
        expect(response).to redirect_to(CatDocumento.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:cat_documento => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {nom_documento: "Otro"}
      }

      it "updates the requested cat_documento" do
        cat_documento = CatDocumento.create! valid_attributes
        put :update, {:id => cat_documento.to_param, :cat_documento => new_attributes}, valid_session
        cat_documento.reload
        expect(cat_documento.nom_documento).to eq("Otro")
      end

      it "redirects to the cat_documento" do
        cat_documento = CatDocumento.create! valid_attributes
        put :update, {:id => cat_documento.to_param, :cat_documento => valid_attributes}, valid_session
        expect(response).to redirect_to(cat_documento)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        cat_documento = CatDocumento.create! valid_attributes
        put :update, {:id => cat_documento.to_param, :cat_documento => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cat_documento" do
      cat_documento = CatDocumento.create! valid_attributes
      expect {
        delete :destroy, {:id => cat_documento.to_param}, valid_session
      }.to change(CatDocumento, :count).by(-1)
    end

    it "redirects to the cat_documentos list" do
      cat_documento = CatDocumento.create! valid_attributes
      delete :destroy, {:id => cat_documento.to_param}, valid_session
      expect(response).to redirect_to(cat_documentos_url)
    end
  end

end
