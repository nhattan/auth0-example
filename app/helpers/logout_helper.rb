# frozen_string_literal: true
module LogoutHelper
  def logout_url
    request_params = {
        returnTo: root_url,
        client_id: ENV['AUTH0_CLIENT_ID']
    }

    URI::HTTPS.build(host: ENV['AUTH0_DOMAIN'], path: '/v2/logout', query: to_query(request_params))
  end

  private

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{URI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end
end
