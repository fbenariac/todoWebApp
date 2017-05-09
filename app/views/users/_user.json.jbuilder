json.extract! user, :id, :username, :email, :password_hash, :password_salt, :is_superuser, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
