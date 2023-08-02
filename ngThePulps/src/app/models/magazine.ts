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
  // magazineEditor: MagazineEditor;
  tableOfContents: string;
  releasedAt: string;
  price: number;
  advertisements: Advertisement[];

  constructor(
    id?: number,
    publication?: Publication,
    name?: string,
    createdAt?: string,
    magazines?: Magazine[],
    stories?: Story[],
    thumbnailUrl?: string,
    imageUrl?: string,
    magazineHtml?: MagazineHtml,
    tableOfContents?: string,
    releasedAt?: string,
    price?: number,
    advertisements?: Advertisement[]
  ) {
    this.id = id || 0;
    this.publication = publication || new Publication();
    this.name = name || '';
    this.createdAt = createdAt || '';
    this.magazines = magazines || [];
    this.stories = stories || [];
    this.thumbnailUrl = thumbnailUrl || '';
    this.imageUrl = imageUrl || '';
    this.magazineHtml = magazineHtml || new MagazineHtml();
    this.tableOfContents = tableOfContents || '';
    this.releasedAt = releasedAt || '';
    this.price = price || 0;
    this.advertisements = advertisements || [];
  }
}
