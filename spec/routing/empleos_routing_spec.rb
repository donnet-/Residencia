require "rails_helper"

RSpec.describe EmpleosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/empleos").to route_to("empleos#index")
    end

    it "routes to #new" do
      expect(:get => "/empleos/new").to route_to("empleos#new")
    end

    it "routes to #show" do
      expect(:get => "/empleos/1").to route_to("empleos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/empleos/1/edit").to route_to("empleos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/empleos").to route_to("empleos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/empleos/1").to route_to("empleos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/empleos/1").to route_to("empleos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/empleos/1").to route_to("empleos#destroy", :id => "1")
    end

  end
end
