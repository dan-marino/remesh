require 'rails_helper'

RSpec.describe "api/conversations", type: :request do
  def json_url(url)
     url + ".json"
  end

  def queryify(url, query)
     url + "?query=#{query}"
  end

  let(:valid_attributes) {
    ({"title" => "Conversation 1"})
  }

  let(:invalid_attributes) {
    ({"title" => ""})
  }

  describe "GET /index json" do
    it "renders a successful response" do
      get json_url(api_conversations_url)
      expect(response).to be_successful
    end
  end

  describe "GET /index json with query that matches" do
    it "renders a successful response" do
      conversation = Conversation.create! valid_attributes
      get queryify(json_url(api_conversations_url), "Conversation")
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "GET /index json with query that matches with random case" do
    it "renders a successful response" do
      conversation = Conversation.create! valid_attributes
      get queryify(json_url(api_conversations_url), "cOnVErsAtiOn")
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "GET /index json with query that doesn't match" do
    it "renders a successful response" do
      conversation = Conversation.create! valid_attributes
      get queryify(json_url(api_conversations_url), "Something else")
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end

  describe "GET /show json" do
    it "renders a successful response" do
      conversation = Conversation.create! valid_attributes
      get json_url(api_conversation_url(conversation))
      expect(response).to be_successful
    end
  end

  describe "POST /create json" do
    context "with valid parameters" do
      it "creates a new Conversation" do
        expect {
          post json_url(api_conversations_url),
            params: { conversation: valid_attributes }
        }.to change(Conversation, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Conversation" do
        expect {
          post json_url(api_conversations_url), params: { conversation: invalid_attributes }
        }.to change(Conversation, :count).by(0)
      end
    end
  end
end
