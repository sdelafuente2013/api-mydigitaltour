# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :lastname, :role, :status)
    end
end
