import { Magazine } from "./magazine";
import { Publication } from "./publication";
import { Story } from "./story";

export class Tag {
  id: number;
  genres: Genre[];
  // authors: Author[];
  stories: Story[];
  magazines: Magazine[];
  publications: Publication[];

  constructor(
    id: number = 0,
    genres: Genre[] = [],
    stories: Story[] = [],
    magazines: Magazine[] = [],
    publications: Publication[] = []

  ) {
    this.id = id;
    this.genres = genres;
    this.stories = stories;
    this.magazines = magazines;
    this.publications = publications;
  }
}

export enum Genre {
  DETECTIVE_CRIME,
  HORROR,
  WESTERN,
  ADVENTURE,
  ROMANCE,
  SCIENCE_FICTION,
  FANTASY,
  WAR_AND_AIR_COMBAT,
  SPORTS,
  NOT_SPECIFIED
}
