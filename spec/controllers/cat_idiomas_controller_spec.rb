require 'rails_helper'

RSpec.describe CatIdiomasController, type: :controller do

  let(:valid_attributes) {
    {nom_idioma: "Inglés"}
  }

  let(:invalid_attributes) {
    {nom_idioma: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CatIdiomasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cat_idioma = CatIdioma.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cat_idioma = CatIdioma.create! valid_attributes
      get :show, {:id => cat_idioma.to_param}, valid_session
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
      cat_idioma = CatIdioma.create! valid_attributes
      get :edit, {:id => cat_idioma.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new CatIdioma" do
        expect {
          post :create, {:cat_idioma => valid_attributes}, valid_session
        }.to change(CatIdioma, :count).by(1)
      end

      it "redirects to the created cat_idioma" do
        post :create, {:cat_idioma => valid_attributes}, valid_session
        expect(response).to redirect_to(CatIdioma.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:cat_idioma => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {nom_idioma: "Alemán"}
      }

      it "updates the requested cat_idioma" do
        cat_idioma = CatIdioma.create! valid_attributes
        put :update, {:id => cat_idioma.to_param, :cat_idioma => new_attributes}, valid_session
        cat_idioma.reload
        expect(cat_idioma.nom_idioma).to eq("Alemán")
      end

      it "redirects to the cat_idioma" do
        cat_idioma = CatIdioma.create! valid_attributes
        put :update, {:id => cat_idioma.to_param, :cat_idioma => valid_attributes}, valid_session
        expect(response).to redirect_to(cat_idioma)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        cat_idioma = CatIdioma.create! valid_attributes
        put :update, {:id => cat_idioma.to_param, :cat_idioma => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cat_idioma" do
      cat_idioma = CatIdioma.create! valid_attributes
      expect {
        delete :destroy, {:id => cat_idioma.to_param}, valid_session
      }.to change(CatIdioma, :count).by(-1)
    end

    it "redirects to the cat_idiomas list" do
      cat_idioma = CatIdioma.create! valid_attributes
      delete :destroy, {:id => cat_idioma.to_param}, valid_session
      expect(response).to redirect_to(cat_idiomas_url)
    end
  end

end
