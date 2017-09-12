require "rails_helper"

RSpec.describe EstudiosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/estudios").to route_to("estudios#index")
    end

    it "routes to #new" do
      expect(:get => "/estudios/new").to route_to("estudios#new")
    end

    it "routes to #show" do
      expect(:get => "/estudios/1").to route_to("estudios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/estudios/1/edit").to route_to("estudios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/estudios").to route_to("estudios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/estudios/1").to route_to("estudios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/estudios/1").to route_to("estudios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/estudios/1").to route_to("estudios#destroy", :id => "1")
    end

  end
end
