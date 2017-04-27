module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper # strategyの名前　ここで指定した名前をdeviseで呼び出す
      option :client_options, site: ENV['OAUTH_URL'], authorize_path: '/oauth/authorize'

      # uidとして設定するデータを指定
      uid { raw_info['user']['id'] }
      # providerから送られてきたデータの内、どれを使いたいか
      info do
        { email: raw_info['user']['email'] }
      end

      # providerのAPIを叩いて、データを取ってくる
      def raw_info
        binding.pry

        @raw_info ||= access_token.get('/oauth/credentials/login.json').parsed
      end
    end
  end
end

# I, [2017-04-25T08:48:07.562036 #1]  INFO -- omniauth: (doorkeeper) Request phase initiated.
# Started GET "/users/auth/doorkeeper/callback?
  # code=f7c1f53bab5d3a6aceff0a84ae3d2bb6d02388ceae695f701c5efbb0d39f4007&
  # state=d4f27ea0298a8dfe7cfc8bba2517fc5e0ce52fcb61c1eae4" for 172.17.0.1 at 2017-04-25 08:48:34 +0000
# Cannot render console from 172.17.0.1! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# I, [2017-04-25T08:48:34.635027 #1]  INFO -- omniauth: (doorkeeper) Callback phase initiated.
# E, [2017-04-25T08:48:35.719237 #1] ERROR -- omniauth: (doorkeeper) Authentication failure!
  # invalid_credentials: OAuth2::Error, invalid_grant:
  # 指定された認可グラントは不正か、有効期限切れか、無効か、リダイレクトURIが異なるか、もしくは別のクライアントに適用されています。
# {"error":"invalid_grant","error_description":"������������������������������������������������������������������������������������������������������URI������������������������������������������������������������������������������������"}
# Processing by Users::OmniauthCallbacksController#failure as HTML
#   Parameters: {"code"=>"f7c1f53bab5d3a6aceff0a84ae3d2bb6d02388ceae695f701c5efbb0d39f4007", "state"=>"d4f27ea0298a8dfe7cfc8bba2517fc5e0ce52fcb61c1eae4"}
# Redirected to http://localhost:4000/users/sign_in
