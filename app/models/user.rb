class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def admin?
    is_admin
  end

  has_many :projects, dependent: :destroy, counter_cache: true

  def to_admin
    self.update_columns(is_admin: true)
  end

  def to_normal
    self.update_columns(is_admin: false)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
    end
   # user.image = auth.info.image # assuming the user model has an image
  end
end
