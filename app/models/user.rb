class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  #->Prelang (user_login/devise)
  has_many :readings
  has_many :blogs
  has_many :trackings
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    # The User was found in our database
    return user if user

    # Check if the User is already registered without Facebook
    user = User.where(email: auth.info.email).first

    return user if user

    # The User was not found and we need to create them
    User.create(name:     auth.extra.raw_info.name,
                provider: auth.provider,
                uid:      auth.uid,
                email:    auth.info.email,
                password: Devise.friendly_token[0,20])
  end

  def daily_usage
    usage = (self.readings.last.value- self.readings.first.value)
    days = ((self.readings.last.read_at-self.readings.first.read_at)/60/60/24)
    (usage/days*100).round/100.0
  end

  def self.leaders
      leaders = User.all.to_a.delete_if {|user| user.readings.count < 2}
      leaders.sort_by(&:daily_usage)
  end


  def username
      self.email.split("@").first
  end


end
