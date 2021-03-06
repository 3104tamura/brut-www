class UsersController < ApplicationController
  def from_facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      # FIXME: compページにリダイレクト
      # sign_in_and_redirect @user, event: :authentication
      # set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      redirect_to thanks_path
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
