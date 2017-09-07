class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_filter :store_previous_action

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
      session[:listing_id] = user.listing.id if user.listing
    end
  end

  def delete_session
   session[:user_id] = nil
   destroy_listing_in_session
  end

  def is_authorized?
    if !current_user
      flash[:error] = "You must be logged in to view that page"
      redirect_to login_path
    end
  end

  def custom_redirect_back
    redirect_back(fallback_location: root_path)
  end
end
