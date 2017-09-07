class SessionsController < ApplicationController
  # app/controllers/sessions_controller.rb
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    user = User.confirm(user_params)
    if user
       session[:user_id] = user.id
       add_listing_to_session
       redirect_to listings_path
    else
      flash[:error] = "Your login information was not correct"
      custom_redirect_back
    end
  end

  def destroy
    delete_session
    flash[:notice] = "You have been logged out"
    redirect_to login_path
  end
end
