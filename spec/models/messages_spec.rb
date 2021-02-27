require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "validation tests" do
    it "ensures text presence" do
      message = Message.new.save
      expect(message).to eq(false)
    end

    it "should save correctly" do
      conversation = Conversation.new(title: "Conversation 1").save
      conversation = Conversation.first
      message = Message.new({conversation_id: conversation.id, text: "Message 1", }).save
      expect(message).to eq(true)
    end
  end
end
