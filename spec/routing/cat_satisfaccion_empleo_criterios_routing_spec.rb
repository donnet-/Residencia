require "rails_helper"

RSpec.describe CatSatisfaccionEmpleoCriteriosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cat_satisfaccion_empleo_criterios").to route_to("cat_satisfaccion_empleo_criterios#index")
    end

    it "routes to #new" do
      expect(:get => "/cat_satisfaccion_empleo_criterios/new").to route_to("cat_satisfaccion_empleo_criterios#new")
    end

    it "routes to #show" do
      expect(:get => "/cat_satisfaccion_empleo_criterios/1").to route_to("cat_satisfaccion_empleo_criterios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cat_satisfaccion_empleo_criterios/1/edit").to route_to("cat_satisfaccion_empleo_criterios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cat_satisfaccion_empleo_criterios").to route_to("cat_satisfaccion_empleo_criterios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cat_satisfaccion_empleo_criterios/1").to route_to("cat_satisfaccion_empleo_criterios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cat_satisfaccion_empleo_criterios/1").to route_to("cat_satisfaccion_empleo_criterios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cat_satisfaccion_empleo_criterios/1").to route_to("cat_satisfaccion_empleo_criterios#destroy", :id => "1")
    end

  end
end
