## Setting up Firebase Emulators

1. FIRST CD INTO BACKEND `cd backend`
1. Install the [Firebase CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli)
1. Run `firebase login`. If creating a new Firebase account, you should not enter any credit card information.
1. Run `npm install -g firebase-tools`
1. Run `firebase emulators:start`
1. Go to `localhost:4000` in a browser to verify that things appear
1. Run `cd functions`
1. Run `npm run start`
1. Open `http://localhost:5001/rateeverything/us-central1/helloWorld` in your browser and you should see `Hello from Firebase!`

> Note: If you are struggling to close ports, you can run the handy `port-killer.sh` script in the backend directory. Just run `./port-killer.sh` and it will kill all the ports that are open for the emulator. You will likely need to give this script permission to run. You can do so by running `chmod +x port-killer.sh` in the backend directory for Linux or Mac. For Windows, I'm not sure but ask and we can figure it out.

## Saving Data

By default the emulator does not save data in between states. This can be helpful if you want to start over with a clean slate, however if you want to save data between states, you can do so by running the following command:

> `firebase emulators:start --export-on-exit personal_emulator_data`

This will save the data to a folder called `personal_emulator_data` in the backend folder. This folder is ignored by git, so you can safely commit your changes without worrying about accidentally committing your data.

But what if you want to start the emulator with the data you saved? You can do so by running the following command:

> `firebase emulators:start --import personal_emulator_data`

This will import the data from the `personal_emulator_data` folder and start the emulator with that data, but when you are done it won't save the data. 

If you want to both start the emulator with previously saved data and save the data when you are done, you can run the following command:

> `firebase emulators:start --import personal_emulator_data --export-on-exit personal_emulator_data`

Please note that if this is your first time running this command and you haven't created the `personal_emulator_data` directory yet, then this command won't work. You will need to run `firebase emulators:start --export-on-exit personal_emulator_data` first, then you can run the command above.

### Sample Data
I have provided some sample data in the `sample_data` folder. This data will be automatically imported when running `npm run start`. You can also import this data by running the following command:

> `firebase emulators:start --import sample_data --export-on-exit personal_emulator_data`

This will get you started. Use the `personal_emulator_data` folder to save your data and don't save anything to the `sample_data` folder.