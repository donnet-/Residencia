require "rails_helper"

RSpec.describe BancoProyectosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/banco_proyectos").to route_to("banco_proyectos#index")
    end

    it "routes to #new" do
      expect(:get => "/banco_proyectos/new").to route_to("banco_proyectos#new")
    end

    it "routes to #show" do
      expect(:get => "/banco_proyectos/1").to route_to("banco_proyectos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/banco_proyectos/1/edit").to route_to("banco_proyectos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/banco_proyectos").to route_to("banco_proyectos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/banco_proyectos/1").to route_to("banco_proyectos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/banco_proyectos/1").to route_to("banco_proyectos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/banco_proyectos/1").to route_to("banco_proyectos#destroy", :id => "1")
    end

  end
end
