require 'rails_helper'

RSpec.describe CatTipoProyectosController, type: :controller do

  let(:valid_attributes) {
    {nombre: "Investigación"}
  }

  let(:invalid_attributes) {
    {nombre: ""}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CatTipoProyectosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cat_tipo_proyecto = CatTipoProyecto.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cat_tipo_proyecto = CatTipoProyecto.create! valid_attributes
      get :show, {:id => cat_tipo_proyecto.to_param}, valid_session
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
      cat_tipo_proyecto = CatTipoProyecto.create! valid_attributes
      get :edit, {:id => cat_tipo_proyecto.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new CatTipoProyecto" do
        expect {
          post :create, {:cat_tipo_proyecto => valid_attributes}, valid_session
        }.to change(CatTipoProyecto, :count).by(1)
      end

      it "redirects to the created cat_tipo_proyecto" do
        post :create, {:cat_tipo_proyecto => valid_attributes}, valid_session
        expect(response).to redirect_to(CatTipoProyecto.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:cat_tipo_proyecto => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {nombre: "Proyecto"}
      }

      it "updates the requested cat_tipo_proyecto" do
        cat_tipo_proyecto = CatTipoProyecto.create! valid_attributes
        put :update, {:id => cat_tipo_proyecto.to_param, :cat_tipo_proyecto => new_attributes}, valid_session
        cat_tipo_proyecto.reload
        expect(cat_tipo_proyecto.nombre).to eq("Proyecto")
      end

      it "redirects to the cat_tipo_proyecto" do
        cat_tipo_proyecto = CatTipoProyecto.create! valid_attributes
        put :update, {:id => cat_tipo_proyecto.to_param, :cat_tipo_proyecto => valid_attributes}, valid_session
        expect(response).to redirect_to(cat_tipo_proyecto)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        cat_tipo_proyecto = CatTipoProyecto.create! valid_attributes
        put :update, {:id => cat_tipo_proyecto.to_param, :cat_tipo_proyecto => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cat_tipo_proyecto" do
      cat_tipo_proyecto = CatTipoProyecto.create! valid_attributes
      expect {
        delete :destroy, {:id => cat_tipo_proyecto.to_param}, valid_session
      }.to change(CatTipoProyecto, :count).by(-1)
    end

    it "redirects to the cat_tipo_proyectos list" do
      cat_tipo_proyecto = CatTipoProyecto.create! valid_attributes
      delete :destroy, {:id => cat_tipo_proyecto.to_param}, valid_session
      expect(response).to redirect_to(cat_tipo_proyectos_url)
    end
  end

end
