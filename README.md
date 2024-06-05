<img src="https://github.com/IngeChiles/GhibliGuide/blob/main/Meta/GhibliGuideIconTransparent.png?raw=true" width="400">



# GhibliGuide

This is a native iOS application for fans of Studio Ghibli films. All aboard the cat bus!

Users can scroll through a display of Ghibli films, learning about each film as they go. If a user has seen a given film, they can mark it as "watched" with a cute Totoro stamp.

This app was developed in XCode 15.4, using Swift 5.10.

I created the UI elements, launch screen, and app icon using Photoshop and Figma. 

In this project, I learned how to create what is essentially a "favoriting" feature for the users to mark films they've seen as "watched", which are then saved and persisted in UserDefaults.

I strenghthened my understanding of the importance of dependency injection for unit testing, because it allowed me to test my viewmodel by injecting it with a mock service.

This project includes unit tests for both the service and view model layers.

I used this free Studio Ghibli API and it's documentation to fetch an array of films to display to the user: 
https://ghibliapi.vercel.app/

No authentication is needed to clone and run this app. Simply clone and open in XCode.
## Screenshots

![App Screenshot](https://github.com/IngeChiles/GhibliGuide/blob/main/Meta/Ghibli-Guide-Main-Screen.png?raw=true)

![App Screenshot](https://github.com/IngeChiles/GhibliGuide/blob/main/Meta/Ghibli-Guide-Main-Stamped.png?raw=true)

![App Screenshot](https://github.com/IngeChiles/GhibliGuide/blob/main/Meta/Ghibli-Guide-Detail.png?raw=true)

![App Screenshot](https://github.com/IngeChiles/GhibliGuide/blob/main/Meta/Ghibli-Guide-Detail-Stamped.png?raw=true)


## Acknowledgements
I gratefully cherrypicked from the following resources:

  - [Karin Prater: Property wrappers in SwiftUI: How to choose between @EnvironmentObject, @ObservableObject and more](https://www.youtube.com/watch?v=J6afKuHJFCE)

   - [Paul Hudson: Sharing @Observable objects through SwiftUI's environment](https://www.hackingwithswift.com/books/ios-swiftui/sharing-observable-objects-through-swiftuis-environment)

 - [Paul Hudson: Letting the User Mark Favorites](https://www.youtube.com/watch?v=FKUBspZLZb8)

  - [Monica Z: How to Create a Rubber Stamp Effect in Adobe Photoshop](https://www.youtube.com/watch?v=scG966JJfJk)
  
  - [Prof G: Add a LaunchScreen to your SwiftUI App](https://www.youtube.com/watch?v=1zqxW1ADRzk)

  - [Professor John Gallaugher's Build Apps with SwiftUI Course](https://www.youtube.com/@profgallaugher)
  
  - [Paul Hudson: 100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)
  
   - [Hillary Nyakundi: How to Write a Good Readme](https://www.freecodecamp.org/news/how-to-write-a-good-readme-file/)


## Roadmap
The API is missing a few films, so I need to either hardcode JSON for the remaining films, or integrate an additional Ghibli API to make my array of films complete.

Once the films returned are exhaustive, it would be fun to present the user with a delightful animation after watching all of them (i.e. "Congrats on watching every Ghibli Film!" with some sort of completed passport/certificate).

I'd also like to add a view for the user to horizontally flip through their collection of watched/stamped films, designed to look like a passport. This would be a fun opportunity to learn about page-flipping animations.

Finally, it would be fun to add an in-app rating system where users could rate their favorites on a scale of 1-5 Soot Sprites.
## License

License for this project: [MIT](https://choosealicense.com/licenses/mit/).

Font used: [Cactus Classical Serif](https://fonts.google.com/specimen/Cactus+Classical+Serif).

Disclaimer: I am in no way affiliated with Studio Ghibli. All films and characters in this app are property of Studio Ghibli.


#

    "Do everything by hand, even when using the computer."

                    - Hiyao Miyazaki
        
    
