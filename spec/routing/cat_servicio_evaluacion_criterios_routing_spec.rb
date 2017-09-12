require "rails_helper"

RSpec.describe CatServicioEvaluacionCriteriosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cat_servicio_evaluacion_criterios").to route_to("cat_servicio_evaluacion_criterios#index")
    end

    it "routes to #new" do
      expect(:get => "/cat_servicio_evaluacion_criterios/new").to route_to("cat_servicio_evaluacion_criterios#new")
    end

    it "routes to #show" do
      expect(:get => "/cat_servicio_evaluacion_criterios/1").to route_to("cat_servicio_evaluacion_criterios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cat_servicio_evaluacion_criterios/1/edit").to route_to("cat_servicio_evaluacion_criterios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cat_servicio_evaluacion_criterios").to route_to("cat_servicio_evaluacion_criterios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cat_servicio_evaluacion_criterios/1").to route_to("cat_servicio_evaluacion_criterios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cat_servicio_evaluacion_criterios/1").to route_to("cat_servicio_evaluacion_criterios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cat_servicio_evaluacion_criterios/1").to route_to("cat_servicio_evaluacion_criterios#destroy", :id => "1")
    end

  end
end
