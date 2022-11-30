import { https, logger } from "firebase-functions";
import { firestoreDB } from "../../database/firestore";
import { User } from "./models";

// This is an example to get a user by userId
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

// http://localhost:5001/rateeverything/us-central1/postUser?email=test@test.com&username=test
// Post user
// TODO need to test
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

// http://localhost:5001/rateeverything/us-central1/putUser?userId=
// Put user
// TODO need to test
export const putUser = https.onRequest(async (request, response) => {
  const userId = request.query.userId;
  const userRef = firestoreDB.collection("users").doc(userId as string);
  const userDoc = await userRef.get();
  if (!userDoc.exists) {
    logger.info("No such document!");
  } else {
    logger.info("Document data:", userDoc.data());
  }
  const user: User = {
    email: request.body.email,
    username: request.body.username,
    timestamp: Date.now(),
  };
  const res = await userRef.set(user);
  logger.info("Hello logs!", { structuredData: true });
  response.send(res);
});

// http://localhost:5001/rateeverything/us-central1/deleteUser?userId=mNlE9QTzP1SOsl6XN0xh
// Delete user
export const deleteUser = https.onRequest(async (request, response) => {
  const userId = request.query.userId;
  const userRef = firestoreDB.collection("users").doc(userId as string);
  const userDoc = await userRef.get();
  if (!userDoc.exists) {
    logger.info("No such document!");
  } else {
    logger.info("Document data:", userDoc.data());
  }
  const res = await userRef.delete();
  logger.info("Hello logs!", { structuredData: true });
  response.send(res);
});
