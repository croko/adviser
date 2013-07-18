require "spec_helper"

describe ClinicsController do
  describe "routing" do

    it "routes to #index" do
      get("/clinics").should route_to("clinics#index")
    end

    it "routes to #new" do
      get("/clinics/new").should route_to("clinics#new")
    end

    it "routes to #show" do
      get("/clinics/1").should route_to("clinics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clinics/1/edit").should route_to("clinics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clinics").should route_to("clinics#create")
    end

    it "routes to #update" do
      put("/clinics/1").should route_to("clinics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clinics/1").should route_to("clinics#destroy", :id => "1")
    end

  end
end
