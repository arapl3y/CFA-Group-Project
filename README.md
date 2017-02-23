![Imgur](http://i.imgur.com/SDXwocY.jpg)

## About
Designed and built by Patrick ([_abazilla_](https://github.com/abazilla)), Alex ([_arapl3y_](https://github.com/arapl3y)), Lee ([_shadolee_](https://github.com/shadolee)) and Dan ([_danmartin99_](https://github.com/danmartin99))

The purpose of the project is to create a ruby terminal app that will blow Trent’s (our teacher) socks off when he comes back on Friday. We have done this by designing an application using Trello and selecting the most relevant user stories and using it for our minimum viable product (MVP). The storyboard can be found at https://trello.com/b/VTKVgeun/team-app.

The requirments are as follows:
 - Idea: Whacky, crazy, funny, clever etc
 - Classes: 3+
 - Gems: 2+
 - Design process: true
 - Tests: 2 per Class

## Installation instructions
The prerequesites are:
 - Ruby
 - The following Ruby Gems
    - catpix
    ```
    $ brew install imagemagick@6
    $ brew link --force imagemagick@6
    $ gem install rmagick    
    $ gem install catpix
    ```
    - tzinfo
    ```
    $ gem install tzinfo
    ```
    - open_weather
    ```
    $ gem install open-weather
    ```
    - colorize
    ```
    $ gem install colorize
    ```
    - IO/console
    ```
    $ gem install IO/console
    ```
    
Download the code from the green button above

### Usage instructions
Once downloaded, in terminal run the following snippet and follow the prompts on the screen

```
in terminal
  $ruby trent.rb
```

If you would like to run the unit tests, then run the following for each
```
test for destination class
  $ ruby trentr-destination.rb
```
```
test for people class
  $ ruby trentr-people.rb
```
```
test for agency class
  $ ruby trentr-agency.rb
```

 
## Design Journey/Process
We began with finding a general idea for our application, which was initiallyra travel application which would determine the best location to travel to based on the users budget. User stories were created in Trello and the donuts/sprinkles method was used to narrow down our list to the essential components.

![Imgur](http://i.imgur.com/4i2S24r.png)

As part of the requirement for the project, we decided what gems we would use, most notably catpix, to display the travel destinations on the terminal screen.

We developed 3 classes within the application that were necessary for the core purpose of the project. The concept changed from a primarily budget travel application to a dating application that incorporates travel opportunities. At this point, we created a logo, and sourced various images depicting of the locations of our current userbase.

![Imgur](http://i.imgur.com/cQ0Ogs7.jpg)

Once completed, we separated the core program to be able to run a multitude of tests for each class. Each test was 100% successful.







