# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  provider               :string
#  uid                    :string
#  name                   :string
#  hosted_avatar_url      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer
#  vendor_id              :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  belongs_to :vendor
  has_many :posts
  has_many :requests, dependent: :destroy

  has_attached_file :avatar, styles: { small: "40x40#" }, default_url: "/user-icon.png", :s3_protocol => :https
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  accepts_nested_attributes_for :requests

  before_save :update_role

  enum role: {
    user: 0,
    vendor: 1,
    admin: 9
  }

  def first_name
    if self.name
      self.name.split(" ")[0]
    else
      "you"
    end
  end

  def recent_requests
    self.requests.order(created_at: "DESC").limit(7)
  end

  def update_role
    #byebug
    if self.vendor_id.present? and self.role != "admin"
      self.role = "vendor"
    elsif self.role != "admin"
      self.role = "user"
    end
    true
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
