require "rails_helper"

RSpec.describe Api::ConversationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/conversations").to route_to("api/conversations#index")
    end

    it "routes to #show" do
      expect(get: "/api/conversations/1").to route_to("api/conversations#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/conversations").to route_to("api/conversations#create")
    end
  end
end
