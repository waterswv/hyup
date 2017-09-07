# README

![](/images/hyup.jpg =100x20)

## Welcome to HYUP - Housing for the rest of us

[We're live on Heroku with Stormy-Gorge](https://stormy-gorge-29733.herokuapp.com/)

### Overview
- Hyup is multi-page webapp that aims to connect new or existing residents of San Francisco with Landlords that have housing available around the city.

####Technical details
* Rails -v 5.1
* jQuery
* materializecss
* Postgresql with ActiveRecord
* Google fonts
* rspec-rails


####Google Maps API
- Google maps was incorporated into this app to pinpoint each listing location from the longitude and latitude of the address provided by the landlord.


```<%= image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{@listing.latitude},#{@listing.longitude}&markers=#{@listing.latitude},#{@listing.longitude}&zoom=15&size=250x250&key=AIzaSyA4BHW3txEdqfxzdTlPwaHsYRSZbfeIcd8",
class: 'img-fluid img-rounded', alt: "#{@listing.title} on the map"%>
<p>Coordinates: <%= @listing.latitude %> <%= @listing.longitude %></p>
```

![](/images/maps.jpg =100x20)

####Planned Features
- Have all users acquire a login with a profile
- Add more cities
- Create "tags" or hobbies for users to find other users with the same or similar tags
