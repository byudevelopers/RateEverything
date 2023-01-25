import { https } from "firebase-functions";
import { firestoreDB } from "../database/firestore";
const topicCollection = "topic";

export const getTopic = https.onRequest(async (request, response) => {
  if (request.query.date === undefined) {
    response.status(400).send("Bad Request");
    return;
  }

  const res = await firestoreDB.collection(topicCollection).doc((request.query.date as string)).get();
  response.send(res);
});

export const postTopic = https.onRequest(async (request, response) => {
  if (request.body.topic === undefined || request.body.date === undefined) {
    response.status(400).send("Bad Request");
    return;
  }
  const topic = {
    topic: request.body.topic
  };

  const res = await firestoreDB.collection(topicCollection).doc((request.body.date as string)).set(topic);
  response.send(res);

});
