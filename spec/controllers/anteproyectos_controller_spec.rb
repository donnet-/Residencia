require 'rails_helper'

RSpec.describe AnteproyectosController, type: :controller do
  
  let(:valid_attributes) { {
    fk_id_proyecto_b: "1",
    fk_numControl: "11161075",
    nombre_anteproy: "SIDCITO",
    asesor_externo: "Jorge Agustín Zárate Pérez",
    status_anteproy: "Aprobado"
  } }
  
  let(:invalid_attributes) { {
    fk_id_proyecto_b: "1a",
    fk_numControl: "1116107a",
    nombre_anteproy: "",
    asesor_externo: "",
    status_anteproy: ""
    } }
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnteproyectosController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  
  describe "GET #index" do
    it "returns a success response" do
      anteproyecto = Anteproyecto.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end
  
  describe "GET #show" do
    it "returns a success response" do
      anteproyecto = Anteproyecto.create! valid_attributes
      get :show, {:id => anteproyecto.to_param}, valid_session
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
      anteproyecto = Anteproyecto.create! valid_attributes
      get :edit, {:id => anteproyecto.to_param}, valid_session
      expect(response).to be_success
    end
  end
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Anteproyecto" do
        expect {
          post :create, {:anteproyecto => valid_attributes}, valid_session
        }.to change(Anteproyecto, :count).by(1)
      end
      
      it "redirects to the created anteproyecto" do
        post :create, {:anteproyecto => valid_attributes}, valid_session
        expect(response).to redirect_to(Anteproyecto.last)
      end
    end
    
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:anteproyecto => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end
  
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {
        fk_id_proyecto_b: "1",
        fk_numControl: "11161075",
        nombre_anteproy: "SIGED",
        asesor_externo: "Jorge Agustín Zárate Pérez",
        status_anteproy: "Aprobado"
      } }
      
      it "updates the requested anteproyecto" do
        anteproyecto = Anteproyecto.create! valid_attributes
        put :update, {:id => anteproyecto.to_param, :anteproyecto => new_attributes}, valid_session
        anteproyecto.reload
        expect(anteproyecto.nombre_anteproy).to eq("SIGED")
      end
      
      it "redirects to the anteproyecto" do
        anteproyecto = Anteproyecto.create! valid_attributes
        put :update, {:id => anteproyecto.to_param, :anteproyecto => valid_attributes}, valid_session
        expect(response).to redirect_to(anteproyecto)
      end
    end
    
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        anteproyecto = Anteproyecto.create! valid_attributes
        put :update, {:id => anteproyecto.to_param, :anteproyecto => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end
  
  describe "DELETE #destroy" do
    it "destroys the requested anteproyecto" do
      anteproyecto = Anteproyecto.create! valid_attributes
      expect {
        delete :destroy, {:id => anteproyecto.to_param}, valid_session
      }.to change(Anteproyecto, :count).by(-1)
    end
    
    it "redirects to the anteproyectos list" do
      anteproyecto = Anteproyecto.create! valid_attributes
      delete :destroy, {:id => anteproyecto.to_param}, valid_session
      expect(response).to redirect_to(anteproyectos_url)
    end
  end
  
end
