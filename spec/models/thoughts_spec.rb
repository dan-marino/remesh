require 'rails_helper'

RSpec.describe Thought, type: :model do
  describe "validation tests" do
    it "ensures text presence" do
      thought = Thought.new.save
      expect(thought).to eq(false)
    end

    it "should save correctly" do
      conversation = Conversation.new(title: "Conversation 1").save
      conversation = Conversation.first

      message = Message.new({conversation_id: conversation.id, text: "Message 1", }).save
      message = Message.first

      thought = Thought.new({message_id: message.id, text: "Thought 1", }).save
      expect(thought).to eq(true)
    end
  end
end
