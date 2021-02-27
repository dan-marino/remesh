require "rails_helper"

RSpec.describe Api::MessagesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/api/messages/1/thoughts").to route_to("api/thoughts#create", message_id: "1")
    end
  end
end
