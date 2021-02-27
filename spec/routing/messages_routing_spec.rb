require "rails_helper"

RSpec.describe Api::MessagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/messages").to route_to("api/messages#index")
    end

    it "routes to #show" do
      expect(get: "/api/messages/1").to route_to("api/messages#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/conversations/1/messages").to route_to("api/messages#create", conversation_id: "1")
    end
  end
end
