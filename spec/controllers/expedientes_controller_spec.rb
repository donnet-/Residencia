require 'rails_helper'

RSpec.describe ExpedientesController, type: :controller do

  let(:valid_attributes) {
    {periodo_expediente: "2017-A",
    fk_id_documento: 1,
    fk_numProyecto: 2}
  }

  let(:invalid_attributes) {
    {periodo_expediente: "2017-A",
    fk_id_documento: "a",
    fk_numProyecto: 2}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExpedientesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      expediente = Expediente.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      expediente = Expediente.create! valid_attributes
      get :show, {:id => expediente.to_param}, valid_session
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
      expediente = Expediente.create! valid_attributes
      get :edit, {:id => expediente.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Expediente" do
        expect {
          post :create, {:expediente => valid_attributes}, valid_session
        }.to change(Expediente, :count).by(1)
      end

      it "redirects to the created expediente" do
        post :create, {:expediente => valid_attributes}, valid_session
        expect(response).to redirect_to(Expediente.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        skip("Validate attributes")
        post :create, {:expediente => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {periodo_expediente: "2017-B",
        fk_id_documento: 1,
        fk_numProyecto: 2}
      }

      it "updates the requested expediente" do
        expediente = Expediente.create! valid_attributes
        put :update, {:id => expediente.to_param, :expediente => new_attributes}, valid_session
        expediente.reload
        expect(expediente.periodo_expediente).to eq("2017-B")
      end

      it "redirects to the expediente" do
        expediente = Expediente.create! valid_attributes
        put :update, {:id => expediente.to_param, :expediente => valid_attributes}, valid_session
        expect(response).to redirect_to(expediente)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        skip("Validate attributes")
        expediente = Expediente.create! valid_attributes
        put :update, {:id => expediente.to_param, :expediente => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested expediente" do
      expediente = Expediente.create! valid_attributes
      expect {
        delete :destroy, {:id => expediente.to_param}, valid_session
      }.to change(Expediente, :count).by(-1)
    end

    it "redirects to the expedientes list" do
      expediente = Expediente.create! valid_attributes
      delete :destroy, {:id => expediente.to_param}, valid_session
      expect(response).to redirect_to(expedientes_url)
    end
  end

end
