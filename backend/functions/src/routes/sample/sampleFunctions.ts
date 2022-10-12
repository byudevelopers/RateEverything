import { https, logger } from "firebase-functions";

import express from "express";

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

const helloWorld = https.onRequest((request, response) => {
  logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Firebase!");
});

const other = https.onRequest((request, response) => {
  logger.info("Hello logs!", { structuredData: true });
  response.send("This is the other function: yoyoyo");
});

// Create a function that takes an id in the URL and returns a string
const app = express();
app.get("/:type/:id", (req, res) => {
  res.send(`Hello ${req.params.type} ${req.params.id}`);
});

const getHelloThere = https.onRequest(app);

export { other, helloWorld, getHelloThere };
