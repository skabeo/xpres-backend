class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at, :first_name, :last_name, :role
end
