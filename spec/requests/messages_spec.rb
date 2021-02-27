require 'rails_helper'

RSpec.describe "api/messages", type: :request do
  def json_url(url)
     url + ".json"
  end

  def queryify(url, query)
     url + "?query=#{query}"
  end

  before do
    conversation = Conversation.new(title: "Conversation 1").save
    @conversation = Conversation.first
  end

  let(:valid_attributes) {
    ({"text" => "Message 1", conversation_id: @conversation.id })
  }

  let(:valid_attributes_empty_query_search) {
    ({"text" => "Something else", conversation_id: @conversation.id })
  }

  let(:valid_params) {
    ({"text" => "Message 1"})
  }

  let(:invalid_attributes) {
    ({"text" => ""})
  }

  describe "GET /index json" do
    it "renders a successful response" do
      get json_url(api_messages_url)
      expect(response).to be_successful
    end
  end

  describe "GET /index json with query that matches" do
    it "renders a successful response" do
      message = Message.create! valid_attributes
      get queryify(json_url(api_messages_url), "Message")
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "GET /index json with query that matches with random case" do
    it "renders a successful response" do
      message = Message.create! valid_attributes
      get queryify(json_url(api_messages_url), "meSsAgE")
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe "GET /index json with query that doesn't match" do
    it "renders a successful response" do
      message = Message.create! valid_attributes
      get queryify(json_url(api_messages_url), "Something else")
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end

  describe "GET /show json" do
    it "renders a successful response" do
      message = Message.create! valid_attributes
      get json_url(api_message_url(message))
      expect(response).to be_successful
    end
  end

  describe "POST /create json" do
    context "with valid parameters" do
      it "creates a new Message" do
        expect {
          post json_url(api_conversation_messages_url(@conversation)),
            params: { message: valid_params }
        }.to change(Message, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Message" do
        expect {
          post json_url(api_conversation_messages_url(@conversation)),
            params: { message: invalid_attributes }
        }.to change(Message, :count).by(0)
      end
    end
  end
end
