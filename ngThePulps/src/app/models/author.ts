import { Story } from "./story";

export class Author {

  id: number;
  fullName: string;
  stories: Story[];
  // tags: Tag[];
  // authorProfile: AuthorProfile;
  thumbnailUrl: string;
  imageUrl: string;

  constructor(
    id: number = 0,
    fullName: string = '',
    stories: Story[] = [],
    thumbnailUrl: string = '',
    imageUrl: string = ''
  ) {
    this.id = id;
    this.fullName = fullName;
    this.stories = stories;
    this.thumbnailUrl = thumbnailUrl;
    this.imageUrl = imageUrl;
  }
}
