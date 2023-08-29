import { Story } from "./story";

export class Collection {
  id: number;
  name: string;
  createdAt: string;
  thumbnailUrl: string;
  backgroundUrl: string;
  stories: Story[];

  constructor(
    id: number = 0,
    name: string = '',
    createdAt: string = '',
    thumbnailUrl: string = '',
    backgroundUrl: string = '',
    stories: Story[] = []
  ) {
    this.id = id;
    this.name = name;
    this.createdAt = createdAt;
    this.thumbnailUrl = thumbnailUrl;
    this.backgroundUrl = backgroundUrl;
    this.stories = stories;
  }
}
