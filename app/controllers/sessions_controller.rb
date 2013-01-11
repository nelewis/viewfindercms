class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      sign_in(user)
    else
      flash.now[:error] = "Your username or password was incorrect. Please try again."
      render 'new'
    end
  end

  def destroy
    sign_out("You have been logged out.")
  end

  private

  def sign_in(user)
    session[:current_user] = user
    redirect_to(:controller => 'users', :action => 'show', :id => user.id)
  end

  def sign_out(message)
    session.delete(:current_user)
    flash[:alert] = message
    redirect_to(:action => 'new')
  end
end
