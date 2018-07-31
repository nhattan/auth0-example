Rails.application.routes.draw do
  get "/auth/oauth2/callback" => "auth0/callback"
  get "/auth/oauth2/failure" => "auth0/failure"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
