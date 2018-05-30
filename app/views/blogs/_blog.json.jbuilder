json.extract! blog, :id, :status, :profile_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
