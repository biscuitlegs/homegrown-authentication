class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, except: [:index, :show, :new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User successfully created."
      redirect_to @user
    else
      flash[:error] = "Error creating user."
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User successfully updated."
      redirect_to @user
    else
      flash[:error] = "Error updating user."
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User successfully deleted."
      reset_session
      redirect_to users_path
    else
      flash[:error] = "Error deleting user."
      redirect_to @user
    end
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
