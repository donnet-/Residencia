require "rails_helper"

RSpec.describe CatTipoProyectosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cat_tipo_proyectos").to route_to("cat_tipo_proyectos#index")
    end

    it "routes to #new" do
      expect(:get => "/cat_tipo_proyectos/new").to route_to("cat_tipo_proyectos#new")
    end

    it "routes to #show" do
      expect(:get => "/cat_tipo_proyectos/1").to route_to("cat_tipo_proyectos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cat_tipo_proyectos/1/edit").to route_to("cat_tipo_proyectos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cat_tipo_proyectos").to route_to("cat_tipo_proyectos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cat_tipo_proyectos/1").to route_to("cat_tipo_proyectos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cat_tipo_proyectos/1").to route_to("cat_tipo_proyectos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cat_tipo_proyectos/1").to route_to("cat_tipo_proyectos#destroy", :id => "1")
    end

  end
end
