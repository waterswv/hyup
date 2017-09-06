class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    user_id = session[:user_id]
    listing = Listing.create(listing_params)
    listing.user_id = user_id
    if listing.save
      flash[:success] = "Your listing was created successfully"
      redirect_to listing_path(listing)
    else
      @listing = listing
      flash[:error] = listing.errors.full_messages.join("\n")
      render(new_listing_path)
    end

  end

  def show
    listing_id = params[:id]
    @listing = Listing.find_by_id(listing_id)
    puts @listing.longitude
    puts @listing.latitude
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
      listing = @listing
      flash[:error] = listing.errors.full_messages.join("\n")
      render(edit_listing_path)
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
