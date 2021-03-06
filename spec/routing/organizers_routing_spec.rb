require "rails_helper"

RSpec.describe OrganizersController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/organizers/1").to route_to("organizers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/organizers/1/edit").to route_to("organizers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/organizers").to route_to("organizers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/organizers/1").to route_to("organizers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/organizers/1").to route_to("organizers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/organizers/1").to route_to("organizers#destroy", :id => "1")
    end
  end

  context 'not routable' do
    it "does not route to #index" do
      expect(:get => "/organizers").not_to be_routable
    end

    #it "does not route to #new" do
    # TODO  expect(:get => "/organizers/new").not_to be_routable
    #end
  end
end
