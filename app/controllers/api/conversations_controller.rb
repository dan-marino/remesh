class Api::ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[ show ]
  skip_forgery_protection

  def index
    query = params[:query]
    unless query&.downcase!
      @conversations = Conversation.all
    else
      @conversations = Conversation.all.select do |conversations|
        conversations.title.downcase.split.include?(query)
      end
    end
  end

  def show
  end

  def create
    @conversation = Conversation.new(conversation_params)

    respond_to do |format|
      if @conversation.save
        format.json { render json: @conversation.to_json, status: :created }
      else
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:title)
  end
end
