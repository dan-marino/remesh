json.merge! @message.attributes

json.messages(@message.thoughts.sort_by(&:id)) do |thought|
  json.merge! thought.attributes
end
