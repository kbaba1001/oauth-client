require 'securerandom'

class User < ActiveRecord::Base
  def self.find_or_create_with_doorkeeper(auth)
    user = self.find_by(provider: auth.provider, uid: auth.uid )
    return user unless user.nil?

    self.create(
      email: auth.info.email,
      provider: auth.provider,
      uid: auth.uid,
      password_digest: Monban.hash_token('password')
    )
  end
end
