## Work in progress
TravelPlanner is a work in progress, and certain features are not implemented yet.

------

## TravelPlanner
TravelPlanner is a Ruby on Rails application designed to help users plan their trips with ease. <br />
 It allows expert users to create campaigns to plan their adventures and share their ideas with others. Whether you're planning a weekend getaway or an extended vacation, TravelPlanner is the perfect tool to organize your trips.

### Features
-**Campaign Creation:** Expert users can create campaigns to plan their trips. Other users can join a trip after the link is shared with them, making it easy to involve friends and fellow travelers.

-**Description and Tagging:** Users can tag their campaigns, making it easy to categorize and find specific trips. For example, you can add tags like "surf" to indicate the type of activities you plan to do during the trip.

-**Information and Updates** Expert members of the trip can publish news updates to keep everyone informed of important informations.

-**Main chatroom:** Campaigns have a chatroom where users can discuss and share their thoughts about the trip plan. Only the owner of a campaign can regulate the chat.

-**To-Do Lists / Topics:** Each campaign has open topics - such as housing, co-driving, etc - created by its members. Each topic has its dedicated chatroom and a list of tasks (WIP). This feature helps members organize tasks and ensure nothing is forgotten.


### Database

![screenshot](app/assets/images/screenshots/DB.png?raw=true "Database screenshot")


## Testing

TravelPlanner is tested using Minitest. To run the test suite, use the following command:

```
rails test
```

This will execute all the tests and provide you with feedback on the status of the application's functionality.


### Screenshots

#### Expert user can create a trip (campaign) from scratch
![screenshot](app/assets/images/screenshots/empty_show.png?raw=true "Empty show screenshot")

#### Example of campaign show as seen by the owner
![screenshot](app/assets/images/screenshots/show_by_owner.png?raw=true "Database screenshot")


#### Example of campaign show as seen by other members
![screenshot](app/assets/images/screenshots/show.png?raw=true "Database screenshot")

#### Example of topic
![screenshot](app/assets/images/screenshots/DB.png?raw=true "Database screenshot")
Tasks haven't been added yet
