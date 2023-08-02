import { Magazine } from "./magazine";
import { MagazineHtml } from "./magazine-html";
import { StoryAnchor } from "./story-anchor";
import { StoryImage } from "./story-image";

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
  storyAnchors: StoryAnchor[];
  // storyType
  releasedAt: string;
  storyImages: StoryImage[];

  constructor(
    id: number = 0,
    title: string = '',
    createdAt: string = '',
    magazines: Magazine[] = [],
    thumbnailUrl: string = '',
    imageUrl: string = '',
    htmlMagazines: MagazineHtml[] = [],
    storyAnchors: StoryAnchor[] = [],
    releasedAt: string = '',
    storyImages: StoryImage[] = []
  ) {
    this.id = id;
    this.title = title;
    this.createdAt = createdAt;
    this.magazines = magazines;
    this.thumbnailUrl = thumbnailUrl;
    this.imageUrl = imageUrl;
    this.htmlMagazines = htmlMagazines;
    this.storyAnchors = storyAnchors;
    this.releasedAt = releasedAt;
    this.storyImages = storyImages;
  }
}
