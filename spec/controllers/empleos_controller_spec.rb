require 'rails_helper'

RSpec.describe EmpleosController, type: :controller do

  let(:valid_attributes) {
    {fk_rfc_emp_inst: "AAAA111111AAA",
    fk_numControl: 11161075,
    f_inicial_empleo: "2017-03-27",
    f_final_empleo: "2017-03-30",
    nivel_jerarquico: "Jefe",
    condicion_trabajo: "Contrato",
    relacion_area_formacion: "100"}
  }

  let(:invalid_attributes) {
    {fk_rfc_emp_inst: "",
    fk_numControl: 11161075,
    f_inicial_empleo: "2017-03-27",
    f_final_empleo: "2017-03-30",
    nivel_jerarquico: "Jefe",
    condicion_trabajo: "Contrato",
    relacion_area_formacion: "100"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmpleosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      empleo = Empleo.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      empleo = Empleo.create! valid_attributes
      get :show, {:id => empleo.to_param}, valid_session
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
      empleo = Empleo.create! valid_attributes
      get :edit, {:id => empleo.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Empleo" do
        expect {
          post :create, {:empleo => valid_attributes}, valid_session
        }.to change(Empleo, :count).by(1)
      end

      it "redirects to the created empleo" do
        post :create, {:empleo => valid_attributes}, valid_session
        expect(response).to redirect_to(Empleo.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:empleo => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {fk_rfc_emp_inst: "AAAA111111AAA",
         fk_numControl: 11161075,
         f_inicial_empleo: "2017-03-27",
         f_final_empleo: "2017-03-30",
         nivel_jerarquico: "Jefe",
         condicion_trabajo: "Base",
         relacion_area_formacion: "100"}
      }

      it "updates the requested empleo" do
        empleo = Empleo.create! valid_attributes
        put :update, {:id => empleo.to_param, :empleo => new_attributes}, valid_session
        empleo.reload
        expect(empleo.condicion_trabajo).to eq("Base")
      end

      it "redirects to the empleo" do
        empleo = Empleo.create! valid_attributes
        put :update, {:id => empleo.to_param, :empleo => valid_attributes}, valid_session
        expect(response).to redirect_to(empleo)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        empleo = Empleo.create! valid_attributes
        put :update, {:id => empleo.to_param, :empleo => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested empleo" do
      empleo = Empleo.create! valid_attributes
      expect {
        delete :destroy, {:id => empleo.to_param}, valid_session
      }.to change(Empleo, :count).by(-1)
    end

    it "redirects to the empleos list" do
      empleo = Empleo.create! valid_attributes
      delete :destroy, {:id => empleo.to_param}, valid_session
      expect(response).to redirect_to(empleos_url)
    end
  end

end
