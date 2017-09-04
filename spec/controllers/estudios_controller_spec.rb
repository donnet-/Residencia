require 'rails_helper'

RSpec.describe EstudiosController, type: :controller do

  let(:valid_attributes) {
    {fk_numControl: 11161075,
    instituto_estudio: "ITO",
    estudio: "Estudio",
    grado_estudio: 2,
    especialidad_estudio: "Especialidad",
    f_inicial_estudio: Date.tomorrow,
    f_final_estudio: 180.days.from_now}
  }

  let(:invalid_attributes) {
    {fk_numControl: "",
    instituto_estudio: "ITO",
    estudio: "Estudio",
    grado_estudio: 2,
    especialidad_estudio: "Especialidad",
    f_inicial_estudio: Date.tomorrow,
    f_final_estudio: 180.days.from_now}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EstudiosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      estudio = Estudio.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      estudio = Estudio.create! valid_attributes
      get :show, {:id => estudio.to_param}, valid_session
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
      estudio = Estudio.create! valid_attributes
      get :edit, {:id => estudio.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Estudio" do
        expect {
          post :create, {:estudio => valid_attributes}, valid_session
        }.to change(Estudio, :count).by(1)
      end

      it "redirects to the created estudio" do
        post :create, {:estudio => valid_attributes}, valid_session
        expect(response).to redirect_to(Estudio.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:estudio => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {fk_numControl: "11161075",
         instituto_estudio: "I",
         estudio: "Estudio",
         grado_estudio: 2,
         especialidad_estudio: "Especialidad",
         f_inicial_estudio: Date.tomorrow,
         f_final_estudio: 180.days.from_now}
      }

      it "updates the requested estudio" do
        estudio = Estudio.create! valid_attributes
        put :update, {:id => estudio.to_param, :estudio => new_attributes}, valid_session
        estudio.reload
        expect(estudio.instituto_estudio).to eq("I")
      end

      it "redirects to the estudio" do
        estudio = Estudio.create! valid_attributes
        put :update, {:id => estudio.to_param, :estudio => valid_attributes}, valid_session
        expect(response).to redirect_to(estudio)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        estudio = Estudio.create! valid_attributes
        put :update, {:id => estudio.to_param, :estudio => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested estudio" do
      estudio = Estudio.create! valid_attributes
      expect {
        delete :destroy, {:id => estudio.to_param}, valid_session
      }.to change(Estudio, :count).by(-1)
    end

    it "redirects to the estudios list" do
      estudio = Estudio.create! valid_attributes
      delete :destroy, {:id => estudio.to_param}, valid_session
      expect(response).to redirect_to(estudios_url)
    end
  end

end
