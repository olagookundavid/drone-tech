# Drone Tech

## Code Structure
A simple app that registers drones for delivery.

The Ui is simple, i used a streambuilder to render the data from firebase(Backend), this streams allow the apps Ui to be updated as the app interacts with firebase, so on any addition or deletion, the Ui updates accordingly

I also created both seperate files for firebase calls, so i don't cloud my Ui with external dependencies calls

Also there's a storage repository to create an abstract layer, this best practice ensures ease of switching to another backend service like supabase, and testing is also made easy.

Good to note that i didn't add lots of comments as good code should be readable and implemented with ease, and this i tried to replicate

link to goggle drive containing APK:
https://drive.google.com/file/d/1kwxxplgyg1xcfrus6lefhftiiw_xhf6_/view?usp=drivesdk



The following folders constitue the app:
- Screens: basically the part that contains all of the Ui code.
- Network Service: the part of the app that connects with the external services, in this case cloud firestore.
- Network Repository: This class is responsible for acting as a middle layer, between Ui and Network dependencies
- Resources/Helpers: these are the helper template that assist me in executing my logic e.g Dialogs, snackbars etc.


NAME: Olagookun David
EMAIL: erijesudo@gmail.com

