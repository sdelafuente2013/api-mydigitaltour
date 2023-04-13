# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private
    def respond_with(user, _opts = {})
      status, message = if user.persisted?
        [200, 'Signed up successfully.']
      else
        [:unprocessable_entity, "User couldn't be created successfully. #{user.errors.full_messages.to_sentence}"]
      end
      render json: {
        status: status,
        message: message,
        data: UserSerializer.new(user).serializable_hash[:data][:attributes]
      }
    end
end
