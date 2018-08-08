class FirebaseController < ApplicationController
  # GET /auth/:provider/callback?id_token=xxx
  def callback
    session[:userinfo] = auth_hash
    redirect_to '/'
  end

  def signout
    session[:userinfo] = nil
    redirect_to '/'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
