require 'rails_helper'

RSpec.describe CatServicioEvaluacionCriteriosController, type: :controller do

  let(:valid_attributes) {
    {nombre_criterio_s: "Criterio"}
  }

  let(:invalid_attributes) {
    {nombre_criterio_s: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CatServicioEvaluacionCriteriosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cat_servicio_evaluacion_criterio = CatServicioEvaluacionCriterio.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cat_servicio_evaluacion_criterio = CatServicioEvaluacionCriterio.create! valid_attributes
      get :show, {:id => cat_servicio_evaluacion_criterio.to_param}, valid_session
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
      cat_servicio_evaluacion_criterio = CatServicioEvaluacionCriterio.create! valid_attributes
      get :edit, {:id => cat_servicio_evaluacion_criterio.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new CatServicioEvaluacionCriterio" do
        expect {
          post :create, {:cat_servicio_evaluacion_criterio => valid_attributes}, valid_session
        }.to change(CatServicioEvaluacionCriterio, :count).by(1)
      end

      it "redirects to the created cat_servicio_evaluacion_criterio" do
        post :create, {:cat_servicio_evaluacion_criterio => valid_attributes}, valid_session
        expect(response).to redirect_to(CatServicioEvaluacionCriterio.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:cat_servicio_evaluacion_criterio => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {nombre_criterio_s: "Abcd"}
      }

      it "updates the requested cat_servicio_evaluacion_criterio" do
        cat_servicio_evaluacion_criterio = CatServicioEvaluacionCriterio.create! valid_attributes
        put :update, {:id => cat_servicio_evaluacion_criterio.to_param, :cat_servicio_evaluacion_criterio => new_attributes}, valid_session
        cat_servicio_evaluacion_criterio.reload
        expect(cat_servicio_evaluacion_criterio.nombre_criterio_s).to eq("Abcd")
      end

      it "redirects to the cat_servicio_evaluacion_criterio" do
        cat_servicio_evaluacion_criterio = CatServicioEvaluacionCriterio.create! valid_attributes
        put :update, {:id => cat_servicio_evaluacion_criterio.to_param, :cat_servicio_evaluacion_criterio => valid_attributes}, valid_session
        expect(response).to redirect_to(cat_servicio_evaluacion_criterio)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        cat_servicio_evaluacion_criterio = CatServicioEvaluacionCriterio.create! valid_attributes
        put :update, {:id => cat_servicio_evaluacion_criterio.to_param, :cat_servicio_evaluacion_criterio => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cat_servicio_evaluacion_criterio" do
      cat_servicio_evaluacion_criterio = CatServicioEvaluacionCriterio.create! valid_attributes
      expect {
        delete :destroy, {:id => cat_servicio_evaluacion_criterio.to_param}, valid_session
      }.to change(CatServicioEvaluacionCriterio, :count).by(-1)
    end

    it "redirects to the cat_servicio_evaluacion_criterios list" do
      cat_servicio_evaluacion_criterio = CatServicioEvaluacionCriterio.create! valid_attributes
      delete :destroy, {:id => cat_servicio_evaluacion_criterio.to_param}, valid_session
      expect(response).to redirect_to(cat_servicio_evaluacion_criterios_url)
    end
  end

end
