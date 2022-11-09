import { https, logger } from "firebase-functions";

import { firestoreDB } from "../../database/firestore";

// Make get request to /topics to get todays current topic

export const getTopic = https.onRequest(async (request, response) => {
  // Get the topic for today from the firstore db
  // Check if the topic for today exists
  // If it does, return the topic
  // If it doesn't, create a new topic and return it
  const topicRef = firestoreDB.collection("topics").doc("today");
  const topicDoc = await topicRef.get();
  if (!topicDoc.exists) {
    logger.info("No such document!");
  } else {
    logger.info("Document data:", topicDoc.data());
  }
  response.send(topicDoc.data());
});
