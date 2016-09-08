json.extract! group_event, :id, :name, :description, :published, :start, :end, :deleted, :created_at, :updated_at
json.url group_event_url(group_event, format: :json)