import { https, logger } from "firebase-functions";
import { firestoreDB } from "../../database/firestore";
import { User } from "./models";

// This is and endpoint example to get a user by userId
// http://localhost:5001/rateeverything/us-central1/getUser?userId=mNlE9QTzP1SOsl6XN0xh
// Get user by id
export const getUser = https.onRequest(async (request, response) => {
  const userId = request.query.userId;
  const userRef = firestoreDB.collection("users").doc(userId as string);
  const userDoc = await userRef.get();
  if (!userDoc.exists) {
    logger.info("No such document!");
  } else {
    logger.info("Document data:", userDoc.data());
  }
  response.send(userDoc.data());
});

// Post user
export const postUser = https.onRequest(async (request, response) => {
  const user: User = {
    email: request.body.email,
    username: request.body.username,
    timestamp: Date.now(),
  };
  const userRef = firestoreDB.collection("users").doc();
  const res = await userRef.set(user);
  logger.info("Hello logs!", { structuredData: true });
  response.send(res);
});

// Put user

// Delete user
