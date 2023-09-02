import { User } from "./user";

export class UserProfile {

  id: number;
  imageUrl: string;
  bio: string;
  bannerUrl: string;
  // user: User;

  constructor(
    id: number = 0,
    imageUrl: string = '',
    bio: string = '',
    bannerUrl: string = '',
    // user: User = new User()
  ) {
    this.id = id;
    this.imageUrl = imageUrl;
    this.bio = bio;
    this.bannerUrl = bannerUrl;
    // this.user = user;
  }
}
