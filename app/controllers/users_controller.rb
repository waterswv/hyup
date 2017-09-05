class UsersController < ApplicationController

  def new
    @new_user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "Successful login"
      session[:user_id] = user.id
      redirect_to "/listings"

    else
      @new_user = user
      flash[:error] = user.errors.full_messages.join(" ")
      render('/users/new')
    end

  end

  def has_listing?
    true
  end

  def getListing
    16
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :password)
  end
end
