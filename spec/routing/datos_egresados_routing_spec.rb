require "rails_helper"

RSpec.describe DatosEgresadosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/datos_egresados").to route_to("datos_egresados#index")
    end

    it "routes to #new" do
      expect(:get => "/datos_egresados/new").to route_to("datos_egresados#new")
    end

    it "routes to #show" do
      expect(:get => "/datos_egresados/1").to route_to("datos_egresados#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/datos_egresados/1/edit").to route_to("datos_egresados#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/datos_egresados").to route_to("datos_egresados#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/datos_egresados/1").to route_to("datos_egresados#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/datos_egresados/1").to route_to("datos_egresados#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/datos_egresados/1").to route_to("datos_egresados#destroy", :id => "1")
    end

  end
end
