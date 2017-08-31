class UsersController < ApplicationController

  def new
    @new_user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :phone, :email, :password_digest)
    user = User.new(user_params)

    if user.save
      redirect_to "/users/new"
    end

  end

end
