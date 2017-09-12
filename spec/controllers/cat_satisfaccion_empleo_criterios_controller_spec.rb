require 'rails_helper'

RSpec.describe CatSatisfaccionEmpleoCriteriosController, type: :controller do

  let(:valid_attributes) {
    {nombre_criterio_e: "Criterio"}
  }

  let(:invalid_attributes) {
    {nombre_criterio_e: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CatSatisfaccionEmpleoCriteriosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cat_satisfaccion_empleo_criterio = CatSatisfaccionEmpleoCriterio.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cat_satisfaccion_empleo_criterio = CatSatisfaccionEmpleoCriterio.create! valid_attributes
      get :show, {:id => cat_satisfaccion_empleo_criterio.to_param}, valid_session
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
      cat_satisfaccion_empleo_criterio = CatSatisfaccionEmpleoCriterio.create! valid_attributes
      get :edit, {:id => cat_satisfaccion_empleo_criterio.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new CatSatisfaccionEmpleoCriterio" do
        expect {
          post :create, {:cat_satisfaccion_empleo_criterio => valid_attributes}, valid_session
        }.to change(CatSatisfaccionEmpleoCriterio, :count).by(1)
      end

      it "redirects to the created cat_satisfaccion_empleo_criterio" do
        post :create, {:cat_satisfaccion_empleo_criterio => valid_attributes}, valid_session
        expect(response).to redirect_to(CatSatisfaccionEmpleoCriterio.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:cat_satisfaccion_empleo_criterio => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {nombre_criterio_e: "Responsable"}
      }

      it "updates the requested cat_satisfaccion_empleo_criterio" do
        cat_satisfaccion_empleo_criterio = CatSatisfaccionEmpleoCriterio.create! valid_attributes
        put :update, {:id => cat_satisfaccion_empleo_criterio.to_param, :cat_satisfaccion_empleo_criterio => new_attributes}, valid_session
        cat_satisfaccion_empleo_criterio.reload
        expect(cat_satisfaccion_empleo_criterio.nombre_criterio_e).to eq("Responsable")
      end

      it "redirects to the cat_satisfaccion_empleo_criterio" do
        cat_satisfaccion_empleo_criterio = CatSatisfaccionEmpleoCriterio.create! valid_attributes
        put :update, {:id => cat_satisfaccion_empleo_criterio.to_param, :cat_satisfaccion_empleo_criterio => valid_attributes}, valid_session
        expect(response).to redirect_to(cat_satisfaccion_empleo_criterio)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        cat_satisfaccion_empleo_criterio = CatSatisfaccionEmpleoCriterio.create! valid_attributes
        put :update, {:id => cat_satisfaccion_empleo_criterio.to_param, :cat_satisfaccion_empleo_criterio => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cat_satisfaccion_empleo_criterio" do
      cat_satisfaccion_empleo_criterio = CatSatisfaccionEmpleoCriterio.create! valid_attributes
      expect {
        delete :destroy, {:id => cat_satisfaccion_empleo_criterio.to_param}, valid_session
      }.to change(CatSatisfaccionEmpleoCriterio, :count).by(-1)
    end

    it "redirects to the cat_satisfaccion_empleo_criterios list" do
      cat_satisfaccion_empleo_criterio = CatSatisfaccionEmpleoCriterio.create! valid_attributes
      delete :destroy, {:id => cat_satisfaccion_empleo_criterio.to_param}, valid_session
      expect(response).to redirect_to(cat_satisfaccion_empleo_criterios_url)
    end
  end

end
