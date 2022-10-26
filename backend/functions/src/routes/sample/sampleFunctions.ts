import { https, logger } from "firebase-functions";

import { firestoreDB } from "../../database/firestore";

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

const helloWorld = https.onRequest((request, response) => {
  logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Firebase!");
});

const sampleDB = https.onRequest(async (_, response) => {
  const data = {
    name: "Los Angeles",
    state: "CA",
    country: "USA",
  };

  // Add a new document in collection "cities" with ID 'LA'
  const res = await firestoreDB.collection("cities").doc("LA").set(data);
  logger.info("Hello logs!", { structuredData: true });
  response.send(res);
});
export { helloWorld, sampleDB };
