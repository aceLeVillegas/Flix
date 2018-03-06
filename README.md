# Lab 3 - movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: 4 hours spent in total

## User Stories

The following **required** user stories are complete:

- The following screens use AutoLayout to adapt to various orientations and screen sizes
   - [X] Movie feed view (+3pt)
   - [X] Detail view (+2pt)

The following **stretch** user stories are implemented:

- [X] Dynamic Height Cells (+1)
- [ ] Collection View AutoLayout (+2)

The following **additional** user stories are implemented:

- [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. A majority of my class had no trouble with the fitting the table view without the header showing, however I had to hard code mine and my safe view would not show up. 
2. For UI/UX what is best practice for cells dynamic or fixed? 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/8Ffnm385z68exgLYaj/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

The header for the table view would not go away with the auto layout so I had to hard code the changes. 

## License

    Copyright 2018 Sarah Villegas 

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.





# Project 2 - movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: 5 hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can tap a cell to see a detail view (+5pts)
- [X] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView (+5pts)

The following **stretch** features are implemented:

- [ ] User can tap a poster in the collection view to see a detail screen of that movie (+3pts)
- [ ] In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer (+3pts)
- [X] Customize the navigation bar (+1pt)
- [ ] List in any optionals you didn't finish from last week (+1-3pts)
   - ...
   - ...

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How far you can manipulate the navigation and tab bar and some limitations for customization. 
2. Rather than pass the enitre data for the movie to each view controller is it benifical only sending the contents needed for each view controller, meaning one veiw controller delegates all data. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/xUOwGliif9TEc86z0A/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Notes

Describe any challenges encountered while building the app.
I finally got an image on the navigation bar however it was getting stretched since it was a bit small. So once I place the image in a rectangle solved the streching problem. I've tried to change the arrow and tab highlight color without any success. Also trying to get the image for the posters and back drop to scale and fit correctly unfortunely because of the images some images will look better than others.

## License

    Copyright 2018 Sarah Villegas

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.




# Project 1 - movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

**Name of your app** is a 

Time spent: 6 hours spent in total

## User Stories

The following **required** user stories are complete:

- [X] User sees app icon in home screen and styled launch screen (+1pt)
- [X] User can scroll through a list of movies currently playing in theaters from The Movie DB API (+5pt)
- [X] User can "Pull to refresh" the movie list (+2pt)
- [X] User sees a loading state while waiting for the movies to load (+2pt)

The following **stretch** user stories are implemented:

- [ ] User sees an alert when there's a networking error (+1pt)
- [ ] User can search for a movie (+3pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete (+2pt)

The following **additional** user stories are implemented:

- [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Using API for the loading state. 
2. Discuss further about usig the view controller to retrieve data from APIs. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

<img src='https://media.giphy.com/media/3o7WIHsSZDpp4l6P3q/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Notes

Describe any challenges encountered while building the app.

I had difficulty using a 3rd party progress HUD and if I had more time I would have it implemented. As for changing the color of a cell that proved harder than expected. I assumed it would be an option on the right panel when on the storyboard However that wasn't the case. I tried hard coding the color change of the background and that method did not work either.  

## License

    Copyright 2018 Sarah Villegas

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    
    # Lab 5 - *Flix*
    
    **Flix** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).
    
    Time spent: **X** hours spent in total
    
    ## User Stories
    
    The following **required** user stories are complete:
    
    - [ ] Create a movie model (+2pt)
    - [ ] Implement the movie model (+2pt)
    - [ ] Implement property observers (+2pt)
    - [ ] Create a basic API Client (+2pt)
    
    The following **additional** user stories are implemented:
    
    - [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)
    
    Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):
    
    1.
    2.
    
    ## Video Walkthrough
    
    Here's a walkthrough of implemented user stories:
    
    <img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
    
    GIF created with [LiceCap](http://www.cockos.com/licecap/).
    
    ## Notes
    
    Describe any challenges encountered while building the app.
    
    ## License
    
    Copyright [2018] [Sarah Villegas]
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
    http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
