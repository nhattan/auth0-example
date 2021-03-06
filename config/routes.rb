Rails.application.routes.draw do
  get 'dashboard/show'

  get '/' => 'home#show'
  get '/dashboard' => 'dashboard#show'

  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/logout' => 'logout#logout'
  root 'home#show'

  get '/auth/:provider/callback', to: 'firebase#callback'
  # delete '/', to: 'home#signout'
end
