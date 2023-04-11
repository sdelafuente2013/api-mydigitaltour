class Api::V1::UserController < ApplicationController
    before_action :authenticate_user!, only: [:current]
    include Devise::Controllers::Helpers
    # include Devise::Controllers::RegistrationsController


    def current
      
        @currentUser = current_user
        p user_signed_in?
        p current_user
        p @currentUser
        render json: { show:  @currentUser }
      end
    end