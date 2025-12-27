class Api::V1::UsersController < Api::V1::BaseController
  def sign_in
    permitted_params = sign_in_params
    user = User.find_by(email: permitted_params[:email])

    if user.blank? || !user.authenticate(permitted_params[:password])
      render json: { token: "", error: "メールアドレスまたはパスワードに該当するユーザが見つかりません。" }, status: :bad_request
    else
      token = create_token(user.id)
      render json: { token:, error: "" }
    end
  end

  private

  def sign_in_params
    params.permit(:email, :password).to_h.transform_keys(&:underscore).symbolize_keys
  end
end
