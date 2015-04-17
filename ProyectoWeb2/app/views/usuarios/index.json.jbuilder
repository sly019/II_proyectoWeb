json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :username, :password_hast, :password_salt, :token
  json.url usuario_url(usuario, format: :json)
end
