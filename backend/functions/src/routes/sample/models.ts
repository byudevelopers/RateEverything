// These are subject to change, a value can be nullable by
// adding a ? to the end of the name like this:
// name?: string

export interface User {
  id?: string;
  email?: string;
  username?: string;
  // picture ?
  timestamp?: number;
}

export interface Rating {
  timestamp: number;
  content: string;
  user?: string;
  userRating: number;
  peerRating: number;
  numPeers: number;
}

export interface Comment {
  timestamp: number;
  content: string;
  user: number;
  peerRating: number;
  numPeers: number;
}

export interface Topic {
  id?: number;
  content?: string;
  value?: number;
  totalUsers?: number;
}
