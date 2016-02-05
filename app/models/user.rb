class User < ActiveRecord::Base
  # Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    # super searches up the inheritance ancestry tree until it reaches the Devise new_with_session method. The return is a new user created using session params.

    # tap will implicitly return super after super has been modified - in this case after we give user.email a value.

    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["rawinfo"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
