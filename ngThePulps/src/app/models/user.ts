import { first } from "rxjs";
import { Collection } from "./collection";

export class User {

  id: number;
  username: string;
  password: string;
  confirmPassword: string;
  enabled: boolean;
  role: string;
  collections: Collection[];
  // userProfile: number;
  email: string;
  firstName: string;
  lastName: string;
  imageUrl: string;

  constructor(
    id: number = 0,
    username: string = '',
    password: string = '',
    confirmPassword: string = '',
    enabled: boolean = false,
    role: string = '',
    collections: Collection[] = [],
    email: string = '',
    firstName: string = '',
    lastName: string = '',
    imageUrl: string = ''
  ) {
    this.id = id;
    this.username = username;
    this.password = password;
    this.confirmPassword = confirmPassword;
    this.enabled = enabled;
    this.role = role;
    this.collections = collections;
    this.email = email;
    this.firstName = firstName;
    this.lastName = lastName;
    this.imageUrl = imageUrl;
  }
}
