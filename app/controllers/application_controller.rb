# frozen_string_literal: true

class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::MimeResponds

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation name lastname role status])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[email password password_confirmation name lastname role status])
    end
end
