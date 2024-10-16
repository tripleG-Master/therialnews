json.extract! news, :id, :headline, :drophead, :body, :created_at, :updated_at
json.url news_url(news, format: :json)
