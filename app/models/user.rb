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

  def days
    (self.readings.last.read_at-self.readings.first.read_at)/60/60/24
  end

  MLS =
  {"Cubic Feet": 28317,
  "Gallons": 3785,
  "Liters": 1000,
  "Cubic Meters": 1000000,
  "Kiloliters": 1000000}

  def daily_usage
    usage = (self.readings.last.value- self.readings.first.value)
    (usage/days*100).round/100.0
  end

  def daily_mls
    debugger
    mls = daily_usage*MLS[unit.to_sym]
  end
    
  def self.leaders
      leaders = User.all.to_a.delete_if {|user| user.readings.count < 2 or user.days < 1}
      leaders.sort_by(&:daily_mls)
  end

  def unit
    if  self.readings.count ==0
      unit = MLS.keys.first.to_s
    else
      unit = self.readings.last.unit
    end
  end

  def username
      self.email.split("@").first
  end


  def masked_username
    mask=username
    range=4..username.size
    mask[range]='*'*range.size
    mask
  end

end
