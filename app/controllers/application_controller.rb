class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def destroy_listing_in_session
    session[:listing_id] = nil
  end

  def add_listing_to_session
    user = User.find_by_id(session[:user_id])
    if user
      session[:listing_id] = user.listing.id
    end
  end

  def delete_session
   session[:user_id] = nil
   destroy_listing_in_session
  end

end
