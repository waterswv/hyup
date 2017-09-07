# README

# <img src="/images/hyup.jpg">

## Welcome to HYUP - Housing for the rest of us

[We're live on Heroku with Stormy-Gorge](https://stormy-gorge-29733.herokuapp.com/)

### Overview
- Hyup is multi-page webapp that aims to connect new or existing residents of San Francisco with Landlords that have housing available around the city.


#### Technical details
* Rails -v 5.1
* jQuery
* materializecss
* Postgresql with ActiveRecord
* Google fonts
* rspec-rails
* paperclip
* table print
* geocoder
* jquery-turbolinks
* bcrypt




#### Google Maps API
- Google maps was incorporated into this app to pinpoint each listing location from the longitude and latitude of the address provided by the landlord.


```<%= image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{@listing.latitude},#{@listing.longitude}&markers=#{@listing.latitude},#{@listing.longitude}&zoom=15&size=250x250&key=AIzaSyA4BHW3txEdqfxzdTlPwaHsYRSZbfeIcd8",
class: 'img-fluid img-rounded', alt: "#{@listing.title} on the map"%>
<p>Coordinates: <%= @listing.latitude %> <%= @listing.longitude %></p>
```


#### RSpec-rails
- The RSpec-rails testing framework was used in this app to test for controllers listing testing for the `CREATE` and `GET` methods.
- Others tested in RSpec:
        - Controller user: CREATE
        - Models: Listing contact phone
        - Models: User email


- The following code tests for the `CREATE` method when creating a new user.

```
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#create" do
    it "creates new user" do
      user_params = {
        name: "Joe Blow",
        email: "hungey@eye.com",
        password:"1234",
        phone:"4151234567"
      }
      post :create, params: { user: user_params}
      expect(User.count).to eq(1)
    end
  end
end
```
# <img src="/images/listings.jpg">

- Image of the listings in San Francisco posted by landlords

#### Planned Features
- Have both tenants and landlords acquire a login with a profile
- Add more cities
- Create "tags" or hobbies for users to find other users with the same or similar tags
