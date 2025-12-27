module Authenticatable
  def authenticate
    authorization_header = request.headers["Authorization"]
    if authorization_header.blank?
      render status: :unauthorized
    else
      token = authorization_header.split(" ")[1]
      secret_key = Rails.application.credentials.secret_key_base
      decoded_token = JWT.decode(token, secret_key, true, { algorithm: "HS256" })

      @user = User.find(decoded_token[0]["user_id"])
    end
  end

  def create_token(user_id)
    payload = { user_id:, exp: (Time.current + 1.days).to_i }
    secret_key = Rails.application.credentials.secret_key_base
    JWT.encode(payload, secret_key, "HS256")
  end
end
