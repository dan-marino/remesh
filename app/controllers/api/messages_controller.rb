class Api::MessagesController < ApplicationController
  before_action :set_message, only: %i[ show ]
  skip_forgery_protection

  def index
    query = params[:query]
    unless query&.downcase!
      @messages = Message.all
    else
      @messages = Message.all.select do |messages|
        messages.text.downcase.split.include?(query)
      end
    end
  end

  def show
  end

  def create
    conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params.merge({conversation: conversation}))
    respond_to do |format|
      if @message.save
        format.json { render json: @message.to_json, status: :created }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:text)
  end
end
