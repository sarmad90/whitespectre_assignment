json.extract! group_event, :id, :name, :description, :published, :start_date, :end_date, :created_at, :updated_at
json.url group_event_url(group_event, format: :json)