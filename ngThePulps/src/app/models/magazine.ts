import { Advertisement } from "./advertisement";
import { MagazineHtml } from "./magazine-html";
import { Publication } from "./publication";
import { Story } from "./story";

export class Magazine {
  id: number;
  // coverArtwork: CoverArtwork;
  publication: Publication;
  name: string;
  createdAt: string;
  magazines: Magazine[];
  // tags: Tag[];
  stories: Story[];
  thumbnailUrl: string;
  imageUrl: string;
  // magazinePdfs: MagazinePdf[];
  magazineHtml: MagazineHtml;
  volume: number;
  issue: number;
  // magazineEditor: MagazineEditor;
  tableOfContents: string;
  releasedAt: string;
  price: number;
  advertisements: Advertisement[];

  constructor(
    id: number = 0,
    publication: Publication = new Publication(),
    name: string = '',
    createdAt: string = '',
    magazines: Magazine[] = [],
    stories: Story[] = [],
    thumbnailUrl: string = '',
    imageUrl: string = '',
    magazineHtml: MagazineHtml = new MagazineHtml(),
    volume: number = 0,
    issue: number = 0,
    tableOfContents: string = '',
    releasedAt: string = '',
    price: number = 0,
    advertisements: Advertisement[] = []
  ) {
    this.id = id;
    this.publication = publication;
    this.name = name;
    this.createdAt = createdAt;
    this.magazines = magazines;
    this.stories = stories;
    this.thumbnailUrl = thumbnailUrl;
    this.imageUrl = imageUrl;
    this.magazineHtml = magazineHtml;
    this.volume = volume;
    this.issue = issue;
    this.tableOfContents = tableOfContents;
    this.releasedAt = releasedAt;
    this.price = price;
    this.advertisements = advertisements;
  }
}
