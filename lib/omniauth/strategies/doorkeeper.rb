module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper
      option :client_options, site: ENV['OAUTH_URL'] #, authorize_path: '/oauth/authorize', token_url: '/oauth/token'
      option :provider_ignores_state, true

      def callback_url
        full_host + script_name + callback_path # + query_string
      end

      # uidとして設定するデータを指定
      uid { raw_info['user']['id'] }

      # providerから送られてきたデータの内、どれを使いたいか
      info do
        { email: raw_info['user']['email'] }
      end

      # providerのAPIを叩いて、データを取ってくる
      def raw_info
        @raw_info ||= access_token.get('/oauth/credentials/login.json').parsed
      end
    end
  end
end
