class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
  after_create :welcome_email
  after_create :create_profile
  has_many :posts, foreign_key: 'author_id'
  has_many :friends
  has_many :friend_requests
  has_one :profile
  accepts_nested_attributes_for :profile

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  private

  def welcome_email
    WelcomeMailer.welcome_email(self).deliver_now
  end

  def create_profile
    @profile = Profile.new
    @profile.user_id = self.id
    @profile.save
  end

end
