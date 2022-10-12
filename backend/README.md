## Setting up Firebase ##
1. FIRST CD INTO BACKEND `cd backend`
2. Install the [Firebase CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli)
3. Run `firebase login`. If creating a new Firebase account, you should not enter any credit card information.
4. Run `npm install -g firebase-tools`
5. Run `firebase init`
  1. Select `Functions` and `Emulators` 
  2. Select `Create a new project`
  3. Enter `rateeverything` for the project id (all of us while technically have our own firebase project named `rateeverything`. This is essential so that the app works uniformally for all of us. This will not cost anything for you to have.)
  4. You can call it `RateEverything` or just hit enter
  5. Select `TypeScript`
  6. Yes use linter
  7. Yes install dependencies
  8. Select `Authentication`, `Functions`, and `Database` emulators
  9. Set port to `9099` for auth
  10. Set port to `5001` for functions
  11. Set port to `9000` for database
  12. Enable the Emulator UI
  13. Leave port empty
  14. Download emulators now
7. Run `firebase emulators:start`
8. Go to `localhost:4000` in a browser to verify that things appear
9. Run `cd functions`
10. Run `npm run serve`
11. Open `http://localhost:5001/rateeverything/us-central1/helloWorld` in your browser and you should see `Hello from Firebase!`

