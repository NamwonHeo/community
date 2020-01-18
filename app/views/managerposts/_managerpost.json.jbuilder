json.extract! managerpost, :id, :user_id, :title, :content, :published, :created_at, :updated_at
json.url managerpost_url(managerpost, format: :json)
