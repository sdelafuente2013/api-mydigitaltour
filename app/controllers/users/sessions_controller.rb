# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  private
    def respond_with(current_user, _opts = {})
      user_attributes = UserSerializer.new(current_user).serializable_hash[:data][:attributes]

      render json: {
        status: { code: 200, message: 'Logged in successfully.' },
        data: { user: user_attributes }
      }
    end

    def respond_to_on_destroy
      current_user = find_user_from_jwt
      status, message = if current_user
        [:ok, 'Logged out successfully.']
      else
        [:unauthorized, "Couldn't find an active session."]
      end
      render json: { status: status, message: message }, status: status
    end

    def find_user_from_jwt
      jwt_payload = decode_jwt_payload
      User.find_by(id: jwt_payload['sub']) if jwt_payload.present?
    end

    def decode_jwt_payload
      JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret!).first rescue nil
    end
end
