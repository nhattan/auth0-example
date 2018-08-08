Rails.application.config.middleware.use OmniAuth::Builder do
  provider OmniAuth::Strategies::FirebaseToken, 'fir-web-example'
end
