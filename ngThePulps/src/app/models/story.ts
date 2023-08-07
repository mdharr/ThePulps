import { Author } from "./author";
import { Magazine } from "./magazine";
import { MagazineHtml } from "./magazine-html";
import { StoryAnchor } from "./story-anchor";
import { StoryImage } from "./story-image";

export class Story {
  id: number;
  title: string;
  createdAt: string;
  // storyPdfs: StoryPdf[];
  authors: Author[];
  // tags: Tag[];
  magazines: Magazine[];
  // collections: Collection[];
  // members: Member[];
  // storyComments: StoryComment[];
  htmlMagazines: MagazineHtml[];
  storyAnchors: StoryAnchor[];
  storyType: StoryType;
  releasedAt: string;
  storyImages: StoryImage[];

  constructor(
    id: number = 0,
    title: string = '',
    createdAt: string = '',
    authors: Author[] = [],
    magazines: Magazine[] = [],
    htmlMagazines: MagazineHtml[] = [],
    storyAnchors: StoryAnchor[] = [],
    storyType: StoryType = StoryType.NOT_SPECIFIED,
    releasedAt: string = '',
    storyImages: StoryImage[] = []
  ) {
    this.id = id;
    this.title = title;
    this.createdAt = createdAt;
    this.authors = authors;
    this.magazines = magazines;
    this.htmlMagazines = htmlMagazines;
    this.storyAnchors = storyAnchors;
    this.storyType = storyType;
    this.releasedAt = releasedAt;
    this.storyImages = storyImages;
  }
}

export enum StoryType {
  SHORT_STORY = 'SHORT_STORY',
  NOVELETTE = 'NOVELETTE',
  SERIAL = 'SERIAL',
  SHORT_FICTION = 'SHORT_FICTION',
  ESSAY = 'ESSAY',
  POEM = 'POEM',
  EDITORIAL = 'EDITORIAL',
  NOT_SPECIFIED = 'NOT_SPECIFIED'
}
