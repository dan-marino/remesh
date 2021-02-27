require 'rails_helper'

RSpec.describe "api/messages", type: :request do
  def json_url(url)
     url + ".json"
  end

  before do
    conversation = Conversation.new(title: "Conversation 1").save
    conversation = Conversation.first

    message = Message.new({conversation_id: conversation.id, text: "Message 1", }).save
    @message = Message.first
  end

  let(:valid_attributes) {
    ({"text" => "Thought 1", message_id: @message.id })
  }

  let(:valid_params) {
    ({"text" => "Thought 1"})
  }

  let(:invalid_attributes) {
    ({"text" => ""})
  }

  describe "POST /create json" do
    context "with valid parameters" do
      it "creates a new Thought" do
        expect {
          post json_url(api_message_thoughts_url(@message)),
            params: { thought: valid_params }
        }.to change(Thought, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Message" do
        expect {
          post json_url(api_message_thoughts_url(@message)),
            params: { thought: invalid_attributes }
        }.to change(Message, :count).by(0)
      end
    end
  end
end
