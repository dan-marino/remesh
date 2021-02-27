json.extract! conversation, :id, :title, :created_at, :messages, :updated_at
json.url api_conversation_url(conversation, format: :json)
