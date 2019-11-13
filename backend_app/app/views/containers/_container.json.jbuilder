json.extract! container, :id, :name, :container_name, :image, :created_at, :updated_at
json.url container_url(container, format: :json)
