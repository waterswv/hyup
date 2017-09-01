class SessionsController < ApplicationController
  # app/controllers/sessions_controller.rb
    def new
      @user = User.new
    end

    def create
      user_params = params.require(:user).permit(:email, :password)
      @user = User.confirm(user_params)

      if @user
         session[:user_id] = @user.id
         p session[:user_id]
         redirect_to '/users/new'
      else
        redirect_to '/login'
      end
    end

    #
    #   user = User.find_by_email(params[:email])
    #   # If the user exists AND the password entered is correct.
    #   if user && user.authenticate(params[:password])
    #     # Save the user id inside the browser cookie. This is how we keep the user
    #     # logged in when they navigate around our website.
    #     session[:user_id] = user.id
    #     redirect_to '/users/new'
    #   else
    #     # flash.alert = "We're not failures"
    #     redirect_to '/login'
    #   end
    # end

    def destroy
      session[:user_id] = nil
      redirect_to '/login'
    end


end
