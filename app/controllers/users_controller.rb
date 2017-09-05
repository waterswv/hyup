class UsersController < ApplicationController

  def new
    @new_user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "Successful login"
      session[:user_id] = user.id
      redirect_to "/users/new"
    end

    else
      flash[:error] = user.errors.full_messages
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :password)
  end
