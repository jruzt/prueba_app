json.extract! movie, :id, :title, :description, :copies, :created_at, :updated_at
json.url movie_url(movie, format: :json)
