class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts
  has_many :requests, dependent: :destroy

  accepts_nested_attributes_for :requests

  enum role: {
    user: 0,
    admin: 9
  }

  def first_name
    self.name.split(" ")[0]
  end

  def recent_requests
    self.requests.order(created_at: "DESC").limit(5)
  end

  def self.from_omniauth(auth, params)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.skip_confirmation!
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.hosted_avatar_url = auth.info.image
      user.requests.build(body: params["request"])
    end
  end
end
