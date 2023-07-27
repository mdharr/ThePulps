import { Publication } from "./publication";

export class Magazine {
  id: number;
  // coverArtwork: CoverArtwork;
  publication: Publication;
  name: string;
  createdAt: string;
  magazines: Magazine[];
  // tags: Tag[];
  // stories: Story[];
  thumbnailUrl: string;
  imageUrl: string;
  // magazinePdfs: MagazinePdf[];
  // magazineHtml: MagazineHtml;
  // magazineEditor: MagazineEditor;

  constructor(
    id: number = 0,
    publication: Publication = new Publication(),
    name: string = '',
    createdAt: string = '',
    magazines: Magazine[] = [],
    thumbnailUrl: string = '',
    imageUrl: string = ''
  ) {
    this.id = id;
    this.publication = publication;
    this.name = name;
    this.createdAt = createdAt;
    this.magazines = magazines;
    this.thumbnailUrl = thumbnailUrl;
    this.imageUrl = imageUrl;
  }
}
