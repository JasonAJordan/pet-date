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
2. Run 'bundle install' 
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

**Messanging** 

Once a date has been accepted, the two users can message each other. Only while a date has been accepted can a user message the other pet's Owner. Messaging works simliar to email or form threads where a User can start a topic and then the two users can reply to that topic, leaving in comments. 