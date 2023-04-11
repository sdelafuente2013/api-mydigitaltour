class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      # Generar token JWT y agregarlo a la respuesta
      jwt = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
      response.set_cookie(JWTSessions.access_cookie,
                          value: jwt,
                          httponly: true,
                          secure: Rails.env.production?)

      render json: { csrf: form_authenticity_token }
    else
      render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  def destroy
    # Invalidar token JWT y eliminar cookie
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    response.delete_cookie(JWTSessions.access_cookie)

    head :ok
  end
end