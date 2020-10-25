class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = "Invalid credentials."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to users_path, notice: "You have successfully logged out."
  end
end
