import { PrivateMessage } from "./private-message";
import { User } from "./user";

export class UserConversation {

  id: number;
  createdAt: string;
  updatedAt: string;
  user: User;
  privateMessages: PrivateMessage[];

  constructor(
    id: number = 0,
    updatedAt: string = '',
    createdAt: string = '',
    user: User = new User(),
    privateMessages: PrivateMessage[] = []
  ) {
    this.id = id;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.user = user;
    this.privateMessages = privateMessages;
  }
}
