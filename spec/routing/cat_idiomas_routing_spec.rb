require "rails_helper"

RSpec.describe CatIdiomasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cat_idiomas").to route_to("cat_idiomas#index")
    end

    it "routes to #new" do
      expect(:get => "/cat_idiomas/new").to route_to("cat_idiomas#new")
    end

    it "routes to #show" do
      expect(:get => "/cat_idiomas/1").to route_to("cat_idiomas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cat_idiomas/1/edit").to route_to("cat_idiomas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cat_idiomas").to route_to("cat_idiomas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cat_idiomas/1").to route_to("cat_idiomas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cat_idiomas/1").to route_to("cat_idiomas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cat_idiomas/1").to route_to("cat_idiomas#destroy", :id => "1")
    end

  end
end
