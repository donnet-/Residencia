require "rails_helper"

RSpec.describe CatDocumentosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cat_documentos").to route_to("cat_documentos#index")
    end

    it "routes to #new" do
      expect(:get => "/cat_documentos/new").to route_to("cat_documentos#new")
    end

    it "routes to #show" do
      expect(:get => "/cat_documentos/1").to route_to("cat_documentos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cat_documentos/1/edit").to route_to("cat_documentos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cat_documentos").to route_to("cat_documentos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cat_documentos/1").to route_to("cat_documentos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cat_documentos/1").to route_to("cat_documentos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cat_documentos/1").to route_to("cat_documentos#destroy", :id => "1")
    end

  end
end
