import { Magazine } from "./magazine";

export class MagazineHtml {
  id: number;
  fileUrl: string;
  magazine: Magazine;
  // stories: Story[];
  // storyAnchors: StoryAnchor[];

  constructor(
    id: number = 0,
    fileUrl: string = '',
    magazine: Magazine = new Magazine()
  ) {
    this.id = id;
    this.fileUrl = fileUrl;
    this.magazine = magazine;
  }
}
