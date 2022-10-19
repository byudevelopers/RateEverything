// These are subject to change, a value can be nullable by
// adding a ? to the end of the name like this:
// name?: string

export interface User {
  id: string;
  email: string;
  username: string;
  // picture ?
  timestamp: number;
}

export interface Rating {
  id: number;
  timestamp: number;
  content: string;
  comments: Comment[];
  userId: number;
  userValue: number;
  peerValue: number;
  numPeers: number;
}

export interface Comment {
  id: number;
  timestamp: number;
  description: string;
  ratingId: number;
  userId: number;
}

export interface Topic {
  id: number;
  content: string;
  value: number;
  totalUsers: number;
}
