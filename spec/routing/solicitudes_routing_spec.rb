require "rails_helper"

RSpec.describe SolicitudesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/solicitudes").to route_to("solicitudes#index")
    end

    it "routes to #new" do
      expect(:get => "/solicitudes/new").to route_to("solicitudes#new")
    end

    it "routes to #show" do
      expect(:get => "/solicitudes/1").to route_to("solicitudes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/solicitudes/1/edit").to route_to("solicitudes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/solicitudes").to route_to("solicitudes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/solicitudes/1").to route_to("solicitudes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/solicitudes/1").to route_to("solicitudes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/solicitudes/1").to route_to("solicitudes#destroy", :id => "1")
    end

  end
end
