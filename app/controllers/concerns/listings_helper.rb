module ListingsHelper
  extend ActiveSupport::Concern

  #check if current users listing_id matches one passed in URL
  def is_listing_owner?
    if session[:listing_id] != params[:id].to_i
      flash[:error] = "You cannot edit a listing you did not create"
      custom_redirect_back
    end
  end

  #default method run on routes requiring an id via before_action above
  #set instance vars and looks up listing
  def get_listing_from_id
    #convert URL id to integer and set into instance var listing_id
    @listing_id = params[:id].to_i
    #look up the listing based on id and cast into instance var
    @listing = Listing.find_by_id(@listing_id)
    #if no listing found redirect back to previous page with error
    if !@listing
      flash[:error] = "That listing does not exist"
      custom_redirect_back
    end
  end
end
