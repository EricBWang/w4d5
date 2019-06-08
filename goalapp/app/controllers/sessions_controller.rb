class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login(user)
    else
      flash.now[:errors] = "Invalid login credentials"
      render :new
  end

  def destroy
    logout
    redirect to new_session_url
  end

end
