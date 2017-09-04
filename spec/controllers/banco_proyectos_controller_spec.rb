require 'rails_helper'

RSpec.describe BancoProyectosController, type: :controller do

  let(:valid_attributes) {
    {fk_rfc_emp_inst: 'AAAA111111AAA',
     nombre_proyecto_b: 'SIDSCITO',
     descrip_proyecto_b: 'Descripción',
     tipo_proyecto_b: 'Tipo',
     fecha_inicio_proyecto_b: Date.tomorrow,
     fecha_termino_proyecto_b: 10.days.from_now,
     num_residentes: 2,
     objetivo_esperado: 'Objetivo',
     pdf_solicitud: 'ruta/solicitud.pdf'}
  }

  let(:invalid_attributes) {
    {fk_rfc_emp_inst: '',
     nombre_proyecto_b: '',
     descrip_proyecto_b: '',
     tipo_proyecto_b: '',
     fecha_inicio_proyecto_b: 1,
     fecha_termino_proyecto_b: 10,
     num_residentes: "a",
     objetivo_esperado: '',
     pdf_solicitud: ''}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BancoProyectosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      banco_proyecto = BancoProyecto.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      banco_proyecto = BancoProyecto.create! valid_attributes
      get :show, {:id => banco_proyecto.to_param}, valid_session
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
      banco_proyecto = BancoProyecto.create! valid_attributes
      get :edit, {:id => banco_proyecto.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BancoProyecto" do
        expect {
          post :create, {:banco_proyecto => valid_attributes}, valid_session
        }.to change(BancoProyecto, :count).by(1)
      end

      it "redirects to the created banco_proyecto" do
        post :create, {:banco_proyecto => valid_attributes}, valid_session
        expect(response).to redirect_to(BancoProyecto.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:banco_proyecto => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {fk_rfc_emp_inst: 'AAAA111111AAA',
         nombre_proyecto_b: 'SIGED',
         descrip_proyecto_b: 'Descripción',
         tipo_proyecto_b: 'Tipo',
         fecha_inicio_proyecto_b: Date.tomorrow,
         fecha_termino_proyecto_b: 10.days.from_now,
         num_residentes: 2,
         objetivo_esperado: 'Objetivo',
         pdf_solicitud: 'ruta/solicitud.pdf'}
      }

      it "updates the requested banco_proyecto" do
        banco_proyecto = BancoProyecto.create! valid_attributes
        put :update, {:id => banco_proyecto.to_param, :banco_proyecto => new_attributes}, valid_session
        banco_proyecto.reload
        expect(banco_proyecto.nombre_proyecto_b).to eq("SIGED")
      end

      it "redirects to the banco_proyecto" do
        banco_proyecto = BancoProyecto.create! valid_attributes
        put :update, {:id => banco_proyecto.to_param, :banco_proyecto => valid_attributes}, valid_session
        expect(response).to redirect_to(banco_proyecto)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        banco_proyecto = BancoProyecto.create! valid_attributes
        put :update, {:id => banco_proyecto.to_param, :banco_proyecto => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested banco_proyecto" do
      banco_proyecto = BancoProyecto.create! valid_attributes
      expect {
        delete :destroy, {:id => banco_proyecto.to_param}, valid_session
      }.to change(BancoProyecto, :count).by(-1)
    end

    it "redirects to the banco_proyectos list" do
      banco_proyecto = BancoProyecto.create! valid_attributes
      delete :destroy, {:id => banco_proyecto.to_param}, valid_session
      expect(response).to redirect_to(banco_proyectos_url)
    end
  end

end
