json.extract! message, :id, :text, :author_id, :created_at, :updated_at
json.url message_url(message, format: :json)
