import { https } from "firebase-functions";
import { Comment, Rating } from "./sample/models";
import { firestoreDB } from "../database/firestore";
const ratingCollection = "rating";

export const getRatings = https.onRequest(async (request, response) => {
  const limit = request.query.limit && parseInt(request.query.limit as string) < 25 ? parseInt(request.query.limit as string) : 25;
  const filter = (request.query.filter === "asc" || request.query.filter === "desc") ? request.query.filter : "desc";
  const last = (request.query.last as string);
  let dbQuery = firestoreDB.collection(ratingCollection).orderBy("timestamp", filter).limit(limit);

  if (last) {
    const lastRating = await firestoreDB.collection(ratingCollection).doc(last).get();
    if (lastRating.exists) {
      dbQuery = dbQuery.startAfter((lastRating.data() as Rating).timestamp);
    }
  }

  const ratings = await dbQuery.get();
  response.send(ratings.docs.map(doc => doc.data()));
});

export const postRating = https.onRequest(async (request, response) => {
  if (request.body.content === undefined || request.body.rating === undefined) {
    response.status(400).send("Bad Request");
    return;
  }
  let rating: Rating = {
    timestamp: Date.now(),
    content: request.body.content,
    userRating: request.body.rating,
    numPeers: 0,
    peerRating: 0,
  };

  const res = await firestoreDB.collection(ratingCollection).doc((request.query.user as string)).set(rating);
  response.send(res);
});

export const postRatingComment = https.onRequest(async (request, response) => {
  console.log(request.body.content, request.body.user, request.query.rating)
  if (request.body.content === undefined || request.body.user === undefined || request.query.rating === undefined) {
    response.status(400).send("Bad Request");
    return;
  }
  let comment: Comment = {
    timestamp: Date.now(),
    content: request.body.content,
    user: request.body.user,
    numPeers: 0,
    peerRating: 0,
  };

  const rating = await firestoreDB.collection(ratingCollection).doc((request.query.rating as string)).get();
  if (rating.exists) {
    // this currently limits. should have unique id instead of user id
    const res = await firestoreDB.collection(ratingCollection).doc((request.query.rating as string)).collection("comments").doc((request.body.user as string)).set(comment);
    response.send(res);
  } else {
    response.status(404).send("Rating not Found");
  }
});
