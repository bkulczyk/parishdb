class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Zalogowano!'
    else
      flash.now.alert = 'Email i/lub hasło są błędne!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, notice: 'Wylogowano!'
  end
end