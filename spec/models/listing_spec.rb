require 'rails_helper'

RSpec.describe Listing, type: :model do
  context "phone number validation" do
    it "expects 10 integers for contact_phone" do
      listing = Listing.new
      listing.valid?
      expect(listing.errors.messages[:contact_phone]).to include("10 digits allowed")
    end
    it "expects a phone number" do
      listing = Listing.new
      listing.valid?
      expect(listing.errors.messages[:contact_phone]).to include("can't be blank")
    end
    it "accepts 123-456-7891 as a valid number" do
      listing = Listing.new(contact_phone: '123-456-7891')
      listing.valid?
      expect(listing.errors.messages[:contact_phone].empty?).to eq(true)
    end
    
  end
end
