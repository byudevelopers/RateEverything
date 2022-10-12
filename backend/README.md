## Setting up Firebase ##
1. FIRST CD INTO BACKEND `cd backend`
2. Install the [Firebase CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli)
3. Run `firebase login`. If creating a new Firebase account, you should not enter any credit card information.
4. Run `npm install -g firebase-tools`
5. Run `firebase emulators:start`
6. Go to `localhost:4000` in a browser to verify that things appear
7. Run `cd functions`
8. Run `npm run serve`
9. Open `http://localhost:5001/rateeverything/us-central1/helloWorld` in your browser and you should see `Hello from Firebase!`