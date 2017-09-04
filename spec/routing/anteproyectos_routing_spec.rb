require "rails_helper"

RSpec.describe AnteproyectosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/anteproyectos").to route_to("anteproyectos#index")
    end

    it "routes to #new" do
      expect(:get => "/anteproyectos/new").to route_to("anteproyectos#new")
    end

    it "routes to #show" do
      expect(:get => "/anteproyectos/1").to route_to("anteproyectos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/anteproyectos/1/edit").to route_to("anteproyectos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/anteproyectos").to route_to("anteproyectos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/anteproyectos/1").to route_to("anteproyectos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/anteproyectos/1").to route_to("anteproyectos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/anteproyectos/1").to route_to("anteproyectos#destroy", :id => "1")
    end

  end
end
