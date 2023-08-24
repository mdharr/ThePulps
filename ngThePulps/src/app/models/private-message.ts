import { User } from "./user";
import { UserConversation } from "./user-conversation";

export class PrivateMessage {

  id: number;
  content: string;
  createdAt: string;
  userConversation: UserConversation;
  sender: User;
  recipient: User;

  constructor(
    id: number = 0,
    content: string = '',
    createdAt: string = '',
    userConversation: UserConversation = new UserConversation(),
    sender: User = new User(),
    recipient: User = new User()
  ) {
    this.id = id;
    this.content = content;
    this.createdAt = createdAt;
    this.userConversation = userConversation;
    this.sender = sender;
    this.recipient = recipient;
  }
}
