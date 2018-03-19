class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def sns_login
    @user = User.find_userinfo(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = t('devise.sessions.signed_in')
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_session_path
    end
  end
end
