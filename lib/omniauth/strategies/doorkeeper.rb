module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper
      option :client_options, site: ENV['OAUTH_URL'], authorize_url: '/oauth/authorize', token_url: '/oauth/token'

      # NOTE lib/omniauth/strategy.rb のメソッドをオーバーライド。
      # doorkeeper の authorization_code を使うとき、query_string が含まれていると、
      # https://github.com/doorkeeper-gem/doorkeeper/blob/v4.2.5/lib/doorkeeper/oauth/authorization_code_request.rb#L47
      # の部分で redirect_url の比較に失敗するため、query_string を取り除く
      def callback_url
        full_host + script_name + callback_path # + query_string
      end

      # uidとして設定するデータを指定
      uid { raw_info['user']['id'] }

      # providerのAPIを叩いて、データを取ってくる
      def raw_info
        @raw_info ||= access_token.get('/oauth/credentials/login.json').parsed
      end
    end
  end
end
