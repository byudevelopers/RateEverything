import { getFirestore } from "firebase-admin/firestore";
import { initializeApp } from "firebase-admin/app";

initializeApp();
export const firestoreDB = getFirestore();
export default firestoreDB;
