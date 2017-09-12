require 'rails_helper'

RSpec.describe DocumentosController, type: :controller do

  let(:valid_attributes) {
    {fk_id_cat_documento: 123,
    pdf_documento: "localización"}
  }

  let(:invalid_attributes) {
    {fk_id_cat_documento: "",
    pdf_documento: "localización"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DocumentosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      documento = Documento.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      documento = Documento.create! valid_attributes
      get :show, {:id => documento.to_param}, valid_session
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
      documento = Documento.create! valid_attributes
      get :edit, {:id => documento.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Documento" do
        expect {
          post :create, {:documento => valid_attributes}, valid_session
        }.to change(Documento, :count).by(1)
      end

      it "redirects to the created documento" do
        post :create, {:documento => valid_attributes}, valid_session
        expect(response).to redirect_to(Documento.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:documento => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {fk_id_cat_documento: 123,
         pdf_documento: "URL"}
      }

      it "updates the requested documento" do
        documento = Documento.create! valid_attributes
        put :update, {:id => documento.to_param, :documento => new_attributes}, valid_session
        documento.reload
        expect(documento.pdf_documento).to eq("URL")
      end

      it "redirects to the documento" do
        documento = Documento.create! valid_attributes
        put :update, {:id => documento.to_param, :documento => valid_attributes}, valid_session
        expect(response).to redirect_to(documento)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        documento = Documento.create! valid_attributes
        put :update, {:id => documento.to_param, :documento => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested documento" do
      documento = Documento.create! valid_attributes
      expect {
        delete :destroy, {:id => documento.to_param}, valid_session
      }.to change(Documento, :count).by(-1)
    end

    it "redirects to the documentos list" do
      documento = Documento.create! valid_attributes
      delete :destroy, {:id => documento.to_param}, valid_session
      expect(response).to redirect_to(documentos_url)
    end
  end

end
