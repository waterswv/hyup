class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    user_id = session[:user_id]
    user = User.find_by_id(user_id)
    if user
      listing = user.listings.create(listing_params)
      if listing.save
        redirect_to listing_path(listing)
      end
      flash[:error] = listing.errors.full_messages.join("\n")
    end
    flash[:error] = 'Your user profile was not found.'
  end

  def show
    listing_id = params[:id]
    @listing = Listing.find_by_id(listing_id)
  end
  
  def edit
    listing_id = params[:id]
    @listing = Listing.find_by_id(listing_id)
  end

  def update
    listing_id = params[:id]
    @listing = Listing.find_by_id(listing_id)
    if @listing.update_attributes(listing_params)
      flash[:success] = "Your listing has been updated successfully"
      redirect_to listing_path(@listing)
    else
      flash[:error] = @listing.errors.full_messages.join("\n")
    end
  end


  def destroy
    listing_id = params[:id]
    listing = Listing.find_by_id(listing_id)
    listing.destroy
    redirect_to listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(:address, :title, :rent, :available_date, :description, :contact_phone, :contact_email, :image, :city)
  end

end
