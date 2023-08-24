export class AuthorProfile {

  id: number;
  imageUrl: string;
  bio: string;

  constructor(
    id: number = 0,
    imageUrl: string = '',
    bio: string = ''
  ) {
    this.id = id;
    this.imageUrl = imageUrl;
    this.bio = bio;
  }
}
