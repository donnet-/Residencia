require 'rails_helper'

RSpec.describe DatosEgresadosController, type: :controller do

  let(:valid_attributes) {
    {fk_numControl: 11161075,
    fecha_actualizacion: "2017-04-04",
    edo_civil_egresado: "Soltero",
    dominio_idioma_egresado: 70,
    estado_egresado: "Oaxaca",
    calle_egresado: "Oriente 9",
    colonia_egresado: "B. A.",
    no_interior_egresado: 109,
    no_exterior_egresado: 0,
    telefono_egresado: 9511234567,
    email_egresado: "egresado@gmail.com"}
  }

  let(:invalid_attributes) {
    {fk_numControl: "",
    fecha_actualizacion: "2017-04-04",
    edo_civil_egresado: "Soltero",
    dominio_idioma_egresado: 70,
    estado_egresado: "Oaxaca",
    calle_egresado: "Oriente 9",
    colonia_egresado: "B. A.",
    no_interior_egresado: 109,
    no_exterior_egresado: 0,
    telefono_egresado: 9511234567,
    email_egresado: "egresado@gmail.com"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DatosEgresadosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      datos_egresado = DatosEgresado.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      datos_egresado = DatosEgresado.create! valid_attributes
      get :show, {:id => datos_egresado.to_param}, valid_session
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
      datos_egresado = DatosEgresado.create! valid_attributes
      get :edit, {:id => datos_egresado.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DatosEgresado" do
        expect {
          post :create, {:datos_egresado => valid_attributes}, valid_session
        }.to change(DatosEgresado, :count).by(1)
      end

      it "redirects to the created datos_egresado" do
        post :create, {:datos_egresado => valid_attributes}, valid_session
        expect(response).to redirect_to(DatosEgresado.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:datos_egresado => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {fk_numControl: 11161075,
         fecha_actualizacion: "2017-04-04",
         edo_civil_egresado: "Casado",
         dominio_idioma_egresado: 70,
         estado_egresado: "Oaxaca",
         calle_egresado: "Oriente 9",
         colonia_egresado: "B. A.",
         no_interior_egresado: 109,
         no_exterior_egresado: 0,
         telefono_egresado: 9511234567,
         email_egresado: "egresado@gmail.com"}
      }

      it "updates the requested datos_egresado" do
        datos_egresado = DatosEgresado.create! valid_attributes
        put :update, {:id => datos_egresado.to_param, :datos_egresado => new_attributes}, valid_session
        datos_egresado.reload
        expect(datos_egresado.edo_civil_egresado).to eq("Casado")
      end

      it "redirects to the datos_egresado" do
        datos_egresado = DatosEgresado.create! valid_attributes
        put :update, {:id => datos_egresado.to_param, :datos_egresado => valid_attributes}, valid_session
        expect(response).to redirect_to(datos_egresado)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        datos_egresado = DatosEgresado.create! valid_attributes
        put :update, {:id => datos_egresado.to_param, :datos_egresado => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested datos_egresado" do
      datos_egresado = DatosEgresado.create! valid_attributes
      expect {
        delete :destroy, {:id => datos_egresado.to_param}, valid_session
      }.to change(DatosEgresado, :count).by(-1)
    end

    it "redirects to the datos_egresados list" do
      datos_egresado = DatosEgresado.create! valid_attributes
      delete :destroy, {:id => datos_egresado.to_param}, valid_session
      expect(response).to redirect_to(datos_egresados_url)
    end
  end

end
