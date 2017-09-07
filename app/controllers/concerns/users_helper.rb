module UsersHelper
  extend ActiveSupport::Concern

  #check if current users id matches one passed in URL
  def is_accessing_self?
    if session[:user_id] != params[:id].to_i
      flash[:error] = "You do not have access to this profile"
      custom_redirect_back
    end
  end

  #default method run on routes requiring an id via before_action above
  #set instance vars and looks up user
  def get_user_from_id
    #convert URL id to integer and set into instance var user_id
    @user_id = params[:id].to_i
    #look up the user based on id and cast into instance var
    @user = User.find_by_id(@user_id)
    #if no user found redirect back to previous page with error
    if !@user
      flash[:error] = "User does not exist"
      custom_redirect_back
    end
  end
end
