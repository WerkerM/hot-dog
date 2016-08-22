class UsersController < ApplicationController

  def confirm_email
    user = User.find_by_email_token(params[:email_token])
    if user
      EmailVerifier.verified(user)
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

end
