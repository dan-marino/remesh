json.merge! @conversation.attributes

json.messages(@conversation.messages.sort_by(&:id)) do |message|
  json.merge! message.attributes

  json.thoughts(message.thoughts) do |card|
    json.merge! thought.attributes
  end
end
