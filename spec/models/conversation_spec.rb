require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe "validation tests" do
    it "ensures title presence" do
      conversation = Conversation.new.save
      expect(conversation).to eq(false)
    end

    it "should save correctly" do
      conversation = Conversation.new(title: "Conversation 1").save
      expect(conversation).to eq(true)
    end
  end
end
