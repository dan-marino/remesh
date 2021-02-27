class Api::ThoughtsController < ApplicationController
  skip_forgery_protection

  def create
    message = Message.find(params[:message_id])
    @thought = Thought.new(thought_params.merge({message: message}))
    respond_to do |format|
      if @thought.save
        format.json { render json: @thought.to_json, status: :created }
      else
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def thought_params
    params.require(:thought).permit(:text)
  end
end
