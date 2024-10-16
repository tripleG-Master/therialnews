json.extract! post, :id, :headline, :drophead, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
