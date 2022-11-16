import { https, logger } from "firebase-functions";
import { firestoreDB } from "../../database/firestore";
import { User } from "./models";

// Get user by id
export const getUser = https.onRequest(async (request, response) => {
  const userId = request.query.userId;
  console.log("userId", userId);
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
  let user = request.query.user as User;
  logger.info("Posting user", { structuredData: true });
  const res = await firestoreDB
    .collection("users")
    .doc(user.id as string)
    .set(user);
  response.send(res);
});

// Put user

// Delete user
