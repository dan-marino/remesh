json.extract! message, :id, :text, :conversation_id, :created_at, :updated_at
json.url api_message_url(message, format: :json)
