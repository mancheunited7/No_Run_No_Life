class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :omniauthable

  def self.find_userinfo(auth)
    user = User.find_by(provider: auth.provider, userid: auth.uid)

    if user.nil?
        user = User.new(
          email: "#{auth.uid}@#{auth.provider}.com",
          provider: auth.provider,
          userid: auth.uid,
          name: auth.info.name,
          password: Devise.friendly_token[0,20]
        )
      user.skip_confirmation!
      user.save
    end
    return user
  end

  def self.create_uuid
    SecureRandom.uuid
  end
end
