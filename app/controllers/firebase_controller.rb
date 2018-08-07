class FirebaseController < ApplicationController
  def callback
    byebug
    session[:auth] = auth_hash
    redirect_to '/'
  end

  # def signout
  #   session[:auth] = nil
  #   redirect_to '/'
  # end

  private

  def auth_hash
    # request.env['omniauth.auth']
    params['id_token']
  end
end
