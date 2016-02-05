class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # event: :authentication will trigger any Warden::Manager.after_authentication code
      sign_in_and_redirect @user, event: :authentication       
      set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
    else
      # Devise autoremoves all session data beginning with the "devise." namespace when a user signs in, so there is always session cleanup.
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
