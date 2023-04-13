# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  private
    def respond_with(current_user, _opts = {})
      user_attributes = UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      render json: { status: { code: 200, message: 'Logged in successfully.', data: { user: user_attributes } } }, status: :ok
    end

    def respond_to_on_destroy
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret!).first rescue nil
      current_user = User.find_by(id: jwt_payload['sub']) if jwt_payload.present?
      status = current_user ? :ok : :unauthorized
      message = current_user ? 'Logged out successfully.' : "Couldn't find an active session."
      render json: { status: status, message: message }, status: status
    end
end
