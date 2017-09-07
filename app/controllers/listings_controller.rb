class ListingsController < ApplicationController
  include ListingsHelper

  before_action :get_listing_from_id, only: [:show, :edit, :destroy, :update]
  before_action :is_authorized?, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_listing_owner?, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    user_id = session[:user_id]
    @listing = Listing.new(listing_params)
    @listing.user_id = user_id
    if @listing.save
      add_listing_to_session
      flash[:success] = "Your listing was created successfully"
      redirect_to listing_path(@listing)
    else
      flash[:error] = @listing.errors.full_messages.join("\n")
      render(new_listing_path)
    end
  end

  def update
    if @listing.update_attributes(listing_params)
      flash[:success] = "Your listing has been updated successfully"
      redirect_to listing_path(@listing)
    else
      flash[:error] = @listing.errors.full_messages.join("\n")
      render(:action => "edit")
    end
  end

  def destroy
    if @listing.destroy
      destroy_listing_in_session
      flash[:success] = "Your listing has been deleted"
      redirect_to listings_path
    else
      flash[:error] = @listing.errors.full_messages.join("\n")
      custom_redirect_back
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:address, :title, :rent, :available_date, :description, :contact_phone, :contact_email, :image, :city)
  end

end
