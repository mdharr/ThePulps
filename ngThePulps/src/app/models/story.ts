import { Magazine } from "./magazine";
import { MagazineHtml } from "./magazine-html";

export class Story {
  id: number;
  title: string;
  createdAt: string;
  // storyPdfs: StoryPdf[];
  // authors: Author[];
  // tags: Tag[];
  magazines: Magazine[];
  // collections: Collection[];
  // members: Member[];
  // storyComments: StoryComment[];
  thumbnailUrl: string;
  imageUrl: string;
  htmlMagazines: MagazineHtml[];
  // storyAnchors: StoryAnchor[];

  constructor(
    id: number = 0,
    title: string = '',
    createdAt: string = '',
    magazines: Magazine[] = [],
    thumbnailUrl: string = '',
    imageUrl: string = '',
    htmlMagazines: MagazineHtml[] = []
  ) {
    this.id = id;
    this.title = title;
    this.createdAt = createdAt;
    this.magazines = magazines;
    this.thumbnailUrl = thumbnailUrl;
    this.imageUrl = imageUrl;
    this.htmlMagazines = htmlMagazines;
  }
}
