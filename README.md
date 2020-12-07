<!-- Test  -->

# README

### Pet Playdate 
============================

Our Pet Playdate is a ruby-on rails project that allows users to set up playdates for their pets with other users. 

--- 

## How to Use. 

1. User must have ruby rails with sqlite3 to run the rails server. 
    - $ ruby-install 
    - $ sqlite3 --version (all modern macs come with sqlite3 pre-installed)
    - $ gem install rails 
2. Run 'bundle install' if rmagick doesn't install try running "brew install pkg-config imagemagick"
3. Run 'rails s' 
4. Open a brower and go to "http://localhost:3000/users"
5. Enjoy. 

## Project Functions and Overview 

**Banner** 

On this page a User is able to Sign Up / Login on the right of the site banner. Once Signed in a user will have access to the My Pets, View Other Pets, Create A Pet, & Create a date tabs. 

- My Pets: Shows a list of the User's pets, if the user has no pets a link to create a pet will be shown. 

- View Other Pets: Shows a list of all the other's Pets that are on the site. 

- Create a Pet: Brings up the Create a Pet form. 

- Create a Date: Brings up the Create a Date form. 

Once Login in a new set of opions will open up on the right of the banner. Welcome [User], Inbox, Edit Profile, Logout. 

- Welcome User: Brings up the User's page

- Inbox: Opens up the messesanging options

- Edit Profile: Alows User to edit their profile. 

- Logout: Logs User out. 

**Pet Dates** 

Users can set up date request with other user's pets. A user can do this by either looking at other user's pets page and selecting the date request form or by hitting the create a date tab and filling out the form. Only once the other user accepts the request will that date show up on the pet's date list. One a user has accepted a date request with another user those two user can also chat. 

Dates invole picking two pets, one from the signed in user and another pet from another user, a time, and a location. This will create a date page showing all the infomration needed. 


**Messaging** 

Once a date has been accepted, the two users can message each other. Only while a date has been accepted can a user message the other pet's Owner. Messaging works simliar to email or form threads where a User can start a topic and then the two users can reply to that topic, leaving in comments. 

Once hitting the inbox tab, the messaging banner will show up. This Banner has 4 tabs, Compose, Inbox, Sent, & Trash. Compose will alow the user to make a new message chain, Inbox shows message chains other people started with the user, sent shows the message chaings that the user started, & trash shows trashed messages. Message chains will show the user's and the recpients image to help clariy who is talking to who. 

**Models and Relationships** 


For our main functions we have 4 models, Users, Pets, Meetings, & Locations 

The User has many Pets while Pets have many Meetings. Locations belong to a Meeting. Pets can have many to many relation with itself due to meeting having two pets, one being the requester and the other being the requestie. There are other models that were created via gems. Two models for Images via activerecord gem and four models for the messaging system via the mailboxer gem. 


## Appliaction Specs: 

**Text Editor** 
- `VSCode` 
- `ruby '2.6.1'`

**Gems** 

`gem 'rails', '~> 6.0.3', '>= 6.0.3.4'`
`gem 'sqlite3', '~> 1.4'`
`gem 'puma', '~> 4.1'`
`gem 'sass-rails', '>= 6'`
`gem 'webpacker', '~> 4.0'`
`gem 'turbolinks', '~> 5'`
`gem 'jbuilder', '~> 2.7'`
`gem 'bcrypt', '~> 3.1.7'`
`gem 'image_processing', '~> 1.2'`
`gem 'rmagick' `
`gem 'bootsnap', '>= 1.4.2', require: false`
`gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]`
`gem 'web-console', '>= 3.3.0'`
`gem 'listen', '~> 3.2'`
`gem 'spring'`
`gem 'spring-watcher-listen', '~> 2.0.0'`
`gem 'capybara', '>= 2.15'`
`gem 'selenium-webdriver'`
`gem 'webdrivers'`
`gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]`
`gem 'mailboxer'`





