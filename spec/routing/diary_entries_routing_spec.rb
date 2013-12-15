require "spec_helper"

describe DiaryEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/diary_entries").should route_to("diary_entries#index")
    end

    it "routes to #new" do
      get("/diary_entries/new").should route_to("diary_entries#new")
    end

    it "routes to #show" do
      get("/diary_entries/1").should route_to("diary_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/diary_entries/1/edit").should route_to("diary_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/diary_entries").should route_to("diary_entries#create")
    end

    it "routes to #update" do
      put("/diary_entries/1").should route_to("diary_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/diary_entries/1").should route_to("diary_entries#destroy", :id => "1")
    end

  end
end
